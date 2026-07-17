package kr.co.dong.inquiry;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
    @Autowired
    private InquiryService inquiryService;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", inquiryService.getList());
        return "inquiry/list";
    }

    @GetMapping("/write")
    public String writeForm(HttpSession session) {
        if (session.getAttribute("loginId") == null) {
            return "redirect:/user/login";
        }
        return "inquiry/write";
    }

    @PostMapping("/write")
    public String write(InquiryVO inquiry, HttpSession session) {
        Integer loginId = (Integer) session.getAttribute("loginId");
        inquiry.setUsers_id(loginId);
        inquiryService.insert(inquiry);
        return "redirect:/inquiry/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int inquiryId, Model model) {
        model.addAttribute("inquiry", inquiryService.getDetail(inquiryId));
        return "inquiry/detail";
    }

    @PostMapping("/answer")
    public String answer(InquiryVO inquiry, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/admin/login";
        }
        inquiryService.updateAnswer(inquiry);
        return "redirect:/inquiry/detail?id=" + inquiry.getInquiryId();
    }

    // 수정 화면 (본인만 접근 가능)
    @GetMapping("/edit")
    public String editForm(@RequestParam("id") int inquiryId, HttpSession session, Model model) {
        Integer loginId = (Integer) session.getAttribute("loginId");
        InquiryVO inquiry = inquiryService.getDetail(inquiryId);
        if (loginId == null || inquiry == null || loginId != inquiry.getUsers_id()) {
            return "redirect:/inquiry/list";
        }
        model.addAttribute("inquiry", inquiry);
        return "inquiry/edit";
    }

    // 수정 처리 (본인만 가능)
    @PostMapping("/edit")
    public String edit(InquiryVO inquiry, HttpSession session) {
        Integer loginId = (Integer) session.getAttribute("loginId");
        InquiryVO original = inquiryService.getDetail(inquiry.getInquiryId());
        if (loginId == null || original == null || loginId != original.getUsers_id()) {
            return "redirect:/inquiry/list";
        }
        inquiryService.updateContent(inquiry);
        return "redirect:/inquiry/detail?id=" + inquiry.getInquiryId();
    }

    // 삭제 처리 (본인 또는 관리자만 가능)
    @PostMapping("/delete")
    public String delete(@RequestParam("id") int inquiryId, HttpSession session) {
        Integer loginId = (Integer) session.getAttribute("loginId");
        Integer adminId = (Integer) session.getAttribute("adminId");
        InquiryVO inquiry = inquiryService.getDetail(inquiryId);
        boolean isOwner = (loginId != null && inquiry != null && loginId == inquiry.getUsers_id());
        boolean isAdmin = (adminId != null);
        if (!isOwner && !isAdmin) {
            return "redirect:/inquiry/list";
        }
        inquiryService.delete(inquiryId);
        return "redirect:/inquiry/list";
    }

    // 답변 삭제 처리 (관리자만 가능)
    @PostMapping("/deleteAnswer")
    public String deleteAnswer(@RequestParam("id") int inquiryId, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/admin/login";
        }
        inquiryService.deleteAnswer(inquiryId);
        return "redirect:/inquiry/detail?id=" + inquiryId;
    }
}