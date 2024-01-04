package com.fpoly.duantotnghiep.config;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	public static final String EMAIL_TEMPLATE = "emailtemplate";
	public static final String EMAIL_TEMPLATE2 = "emailtemplate2";
    public static final String EMAIL_TEMPLATE3 = "emailtemplate3";
    @Autowired
    JavaMailSender sender;
    private final TemplateEngine templateEngine;
    
    public void activeAccountEmail(String email, String fullName, String url) throws Exception {
        try {
            // Tạo message
            MimeMessage message = sender.createMimeMessage();
            // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom("phuongnhpc03087@fpt.edu.vn");
            helper.setTo(email);
            helper.setSubject("XÁC MINH TÀI KHOẢN");
            Context context = new Context();
            String text = templateEngine.process(EMAIL_TEMPLATE, context);
            helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n"
                    + "    <title>Xác minh tài khoản</title>\r\n" + "    <style>\r\n" + "        body {\r\n"
                    + "            font-family: Arial, sans-serif;\r\n" + "            color: #333333;\r\n"
                    + "        }\r\n" + "        .container {\r\n" + "            max-width: 600px;\r\n"
                    + "            margin: 0 auto;\r\n" + "            padding: 20px;\r\n"
                    + "            border: 1px solid #dddddd;\r\n" + "            border-radius: 5px;\r\n"
                    + "        }\r\n" + "        h1 {\r\n" + "            font-size: 24px;\r\n"
                    + "            margin-bottom: 20px;\r\n" + "        }\r\n" + "        p {\r\n"
                    + "            margin-bottom: 20px;\r\n" + "        }\r\n" + "        .button {\r\n"
                    + "            display: inline-block;\r\n" + "            background-color: #4CAF50;\r\n"
                    + "            color: white;\r\n" + "            padding: 10px 20px;\r\n"
                    + "            text-align: center;\r\n" + "            text-decoration: none;\r\n"
                    + "            cursor: pointer;\r\n" + "            border-radius: 5px;\r\n" + "        }\r\n"
                    + "        .button:hover {\r\n" + "            background-color: #45a049;\r\n" + "        }\r\n"
                    + "    </style>\r\n" + "</head>\r\n" + "<body>\r\n" + "    <div class=\"container\">\r\n"
                    + "        <h1>Xác minh tài khoản của bạn</h1>\r\n" + "        <p>Xin chào " + fullName
                    + ",</p>\r\n"
                    + "        <p>Cảm ơn bạn đã đăng ký tài khoản tại PolyAcademy. Để hoàn tất quá trình đăng ký, vui lòng xác minh tài khoản bằng cách nhấp vào nút dưới đây:</p>\r\n"
                    + "<a class=\"button\" href=\"" + url + "\" style=\"color: white;\">Xác minh tài khoản</a>\r\n"
                    + "        <p>Nếu bạn không thực hiện đăng ký tại PolyAcademy, vui lòng bỏ qua email này.</p>\r\n"
                    + "        <p>Xin cảm ơn và chúc bạn có trải nghiệm tuyệt vời tại PolyAcademy!</p>\r\n"
                    + "        <p>Trân trọng,</p>\r\n" + "    </div>\r\n" + "</body>\r\n" + "</html>", true);
            sender.send(message);
        } catch (Exception e) {
            throw e;
        }
    }

    public void otpAccountEmail(String email, String otp) throws Exception {
        try {
            // Tạo message
            MimeMessage message = sender.createMimeMessage();
            // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom("phuongnhpc03087@fpt.edu.vn");
            helper.setTo(email);
            helper.setSubject("ĐỔI MẬT KHẨU");
            helper.setText("<!DOCTYPE html>\r\n"
                    + "<html>\r\n"
                    + "<head>\r\n"
                    + "  <title>Thông báo cấp mã OTP</title>\r\n"
                    + "  <style>\r\n"
                    + "    body {\r\n"
                    + "      font-family: Arial, sans-serif;\r\n"
                    + "      background-color: #f2f2f2;\r\n"
                    + "    }\r\n"
                    + "\r\n"
                    + "    .container {\r\n"
                    + "      max-width: 400px;\r\n"
                    + "      margin: 0 auto;\r\n"
                    + "      padding: 20px;\r\n"
                    + "      background-color: #fff;\r\n"
                    + "      border-radius: 5px;\r\n"
                    + "      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\r\n"
                    + "      margin-top: 100px;\r\n"
                    + "    }\r\n"
                    + "\r\n"
                    + "    h2 {\r\n"
                    + "      text-align: center;\r\n"
                    + "    }\r\n"
                    + "\r\n"
                    + "    .message {\r\n"
                    + "      margin-bottom: 20px;\r\n"
                    + "    }\r\n"
                    + "\r\n"
                    + "    .message p {\r\n"
                    + "      margin-bottom: 10px;\r\n"
                    + "      line-height: 1.5;\r\n"
                    + "    }\r\n"
                    + "\r\n"
                    + "    .cta-button {\r\n"
                    + "      display: block;\r\n"
                    + "      width: 100%;\r\n"
                    + "      padding: 10px;\r\n"
                    + "      background-color: #4CAF50;\r\n"
                    + "      color: #fff;\r\n"
                    + "      border: none;\r\n"
                    + "      border-radius: 5px;\r\n"
                    + "      font-size: 16px;\r\n"
                    + "      text-align: center;\r\n"
                    + "      text-decoration: none;\r\n"
                    + "    }\r\n"
                    + "  </style>\r\n"
                    + "</head>\r\n"
                    + "<body>\r\n"
                    + "  <div class=\"container\">\r\n"
                    + "    <h2>Thông báo cấp mã OTP</h2>\r\n"
                    + "    <div class=\"message\">\r\n"
                    + "      <p>Bạn đã yêu cầu cấp mã OTP để đổi mật khẩu tài khoản của mình. Vui lòng sử dụng mã OTP sau đây (Lưu ý, mã OTP chỉ tồn tại 1 phút):</p>\r\n"
                    + "      <h3>Mã OTP: " + otp + "</h3>\r\n"
                    + "    </div>\r\n"
                    + "    <div class=\"message\">\r\n"
                    + "      <p>Nếu bạn không yêu cầu cấp mã OTP này, vui lòng liên hệ với chúng tôi ngay.</p>\r\n"
                    + "      <p>Xin cảm ơn!</p>\r\n"
                    + "    </div>\r\n"
                    + "  </div>\r\n"
                    + "</body>\r\n"
                    + "</html>", true);
            sender.send(message);

        } catch (Exception e) {
            throw e;
        }
    }
    public void checkoutSendEmailPaypal(String email,String transactionId,String tenKhoaHoc,String formattedTotalAmount,String formattedDate,String payerId) throws Exception {
    	try {
    		  // Tạo message
            MimeMessage message = sender.createMimeMessage();
            // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            Context context = new Context();
            context.setVariables(Map.of("transactionId", transactionId, "tenKhoaHoc",tenKhoaHoc,"formattedTotalAmount",formattedTotalAmount,"formattedDate",formattedDate,"payerId",payerId ));
            String text = templateEngine.process(EMAIL_TEMPLATE, context);
            
            helper.setFrom("phuongnhpc03087@fpt.edu.vn");
            helper.setTo(email);
            helper.setSubject("Đơn hàng tại Polyacademy đã được thanh toán!");
            helper.setText(text,true);
            sender.send(message);
		} catch (Exception e) {
			throw e;
		}
    	
    }
    
    public void checkoutSendEmailVnpay(String email,String Txnref,String formattedTotalAmount,String formattedDate) throws Exception {
    	try {
    		  // Tạo message
            MimeMessage message = sender.createMimeMessage();
            // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            Context context = new Context();
            context.setVariables(Map.of("Txnref", Txnref,"formattedTotalAmount",formattedTotalAmount,"formattedDate",formattedDate ));
            String text = templateEngine.process(EMAIL_TEMPLATE2, context);
            
            helper.setFrom("phuongnhpc03087@fpt.edu.vn");
            helper.setTo(email);
            helper.setSubject("Đơn hàng tại Polyacademy đã được thanh toán!");
            helper.setText(text,true);
            sender.send(message);
		} catch (Exception e) {
			throw e;
		}
    	
    }

    public void sendEmailDuyet(String email,String Txnref,String formattedDate) throws Exception {
    	try {
    		  // Tạo message
            MimeMessage message = sender.createMimeMessage();
            // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            Context context = new Context();
            context.setVariables(Map.of("Txnref", Txnref,"formattedDate",formattedDate ));
            String text = templateEngine.process(EMAIL_TEMPLATE3, context);
            
            helper.setFrom("phuongnhpc03087@fpt.edu.vn");
            helper.setTo(email);
            helper.setSubject("Khóa học tại Polyacademy đã được duyệt thành công!");
            helper.setText(text,true);
            sender.send(message);
		} catch (Exception e) {
			throw e;
		}
    	
    }
}