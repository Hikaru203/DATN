package com.fpoly.duantotnghiep.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import com.fpoly.duantotnghiep.Entity.LoaiKhoaHoc;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.LoaiKhoaHocRepository;
import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.YouTubeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class YouTubeController {
    String accessToken;

    @Autowired
    private YouTubeService youTubeService;

    @Autowired
    CookieService cookieService;

    @Autowired
    LoaiKhoaHocRepository loaiKhoaHocRepository;

    @GetMapping("/Admin/Video")
    public String authenticate(Model model, HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "Admin/Video";

        } else {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "Admin/Video";
        }
    }

    @GetMapping("/courseOnline/uploadKhoaHoc")
    public String authenticate2(Model model, HttpSession session) {
        List<LoaiKhoaHoc> loaiKhoaHocs = loaiKhoaHocRepository.findAll();
        model.addAttribute("tenKhoaHocList", loaiKhoaHocs);

        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "uploadKhoaHoc";

        } else {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "uploadKhoaHoc";
        }
    }

    @GetMapping("/oauth2callback")
    public String oauth2callback(@RequestParam("code") String authorizationCode, HttpSession session, Model model) {
        try {
            accessToken = youTubeService.getAccessToken(authorizationCode);
            session.setAttribute("accessToken", accessToken);

            NguoiDung user = (NguoiDung) session.getAttribute("user");
            System.out.println("user: " + user.getChucVu());

            // Trong phương thức khác
            String title = (String) session.getAttribute("title");
            String description = (String) session.getAttribute("description");
            String privacyStatus = (String) session.getAttribute("privacyStatus");
            MultipartFile file = (MultipartFile) session.getAttribute("file");

            try {
                youTubeService.uploadVideo(title, description, privacyStatus, file, accessToken);

                String authorizationUrl = youTubeService.getAuthorizationUrl();
                model.addAttribute("accessToken", accessToken);
                model.addAttribute("authorizationUrl", authorizationUrl);
                if (user.getChucVu().equals("Admin")) {
                    return "redirect:/Admin/Video";
                } else {
                    return "redirect:/courseOnline/uploadKhoaHoc";
                }
            } catch (Exception e) {
                return "redirect:/Admin/Video";
            }
        } catch (Exception e) {
            // Handle exceptions
            return "redirect:/Admin/Video";
        }

    }

    @PostMapping("/youtube/uploadVideo")
    public String uploadVideo(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("privacyStatus") String privacyStatus,
            @RequestParam("file") MultipartFile file,
            HttpSession session, Model model) {

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);

            // Lưu các giá trị vào session

            session.setAttribute("accessToken", accessToken);
            session.setAttribute("authorizationUrl", authorizationUrl);

            return "redirect:" + authorizationUrl;
        } else {
            try {
                youTubeService.uploadVideo(title, description, privacyStatus, file, accessToken);
                return "Admin/Video";
            } catch (Exception e) {
                model.addAttribute("error", e.getMessage());
                return "Admin/Video";
            }
        }
    }

}
