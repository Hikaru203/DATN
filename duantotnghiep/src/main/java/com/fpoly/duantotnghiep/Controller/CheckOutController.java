package com.fpoly.duantotnghiep.Controller;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;
import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.Entity.ThanhToan;
import com.fpoly.duantotnghiep.config.VNPayService;
import com.fpoly.duantotnghiep.service.DangKyKhoaHocService;
import com.fpoly.duantotnghiep.service.ThanhToanService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CheckOutController {
	@Autowired
	private VNPayService vnPayService;

	@Autowired
	private ThanhToanService thanhToanService;

	@Autowired
	DangKyKhoaHocService dangKyKhoaHocService;

	@GetMapping("/courseOnline/CheckOut")
	public String CheckOut() {
		return "checkout";
	}

	@GetMapping("/courseOnline/ordersuccess2")
	public String ordersuccess2() {
		return "ordersuccess2";
	}

	@PostMapping("/courseOnline/submitOrder")
	public String submidOrder(@RequestParam("amount") int orderTotal, @RequestParam("tenNguoiDung") String orderInfo,
			HttpServletRequest request, @CookieValue(value = "username", defaultValue = "0") String userIdCookie,
			@RequestParam("paymentMethod") String paymentMenThod, @RequestParam("idKhoaHoc") String idKhoaHoc,
			@RequestParam("idNguoiDung") String idNguoiDung) {

		String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		String vnpayUrl = vnPayService.createOrder(orderTotal, orderInfo, baseUrl);

		HttpSession session = request.getSession();

		if (paymentMenThod.equals("COD")) {

			return "redirect:" + "ordersuccess2";
		} else {
			session.setAttribute("idNguoiDung", idNguoiDung);
			session.setAttribute("idKhoaHoc", idKhoaHoc);
			return "redirect:" + vnpayUrl;
		}

	}

	@GetMapping("/vnpay-payment")
	public String getVnpayPayment(HttpServletRequest request, Model model) {
		int paymentStatus = vnPayService.orderReturn(request);
		HttpSession session = request.getSession();

		Integer idNguoiDung = Integer.parseInt(session.getAttribute("idNguoiDung").toString());
		Integer idKhoaHoc = Integer.parseInt(session.getAttribute("idKhoaHoc").toString());

		System.out.println(idNguoiDung);
		System.out.println(idKhoaHoc);
		String paymentTimeString = request.getParameter("vnp_PayDate");
		String Txnref = request.getParameter("vnp_TxnRef");
		String totalPrice = request.getParameter("vnp_Amount");
		String orderInfo = request.getParameter("vnp_OrderInfo");

		double totalAmount = Double.parseDouble(String.valueOf(Double.valueOf(totalPrice) / 100));
		DecimalFormatSymbols symbols = new DecimalFormatSymbols(new Locale("vi", "VN"));
		symbols.setDecimalSeparator(',');
		symbols.setGroupingSeparator('.');
		DecimalFormat currencyFormatter = new DecimalFormat("###,###,### VND");

		String formattedTotalAmount = currencyFormatter.format(totalAmount);

		// Chuyển đổi chuỗi thời gian sang đối tượng LocalDateTime
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		LocalDateTime paymentTime = LocalDateTime.parse(paymentTimeString, inputFormatter);

		// Định dạng thời gian sang "dd/MM/yyyy HH:mm:ss"
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		String formattedPaymentTime = paymentTime.format(outputFormatter);

		if (paymentStatus == 1) {
			ThanhToan thanhToan = new ThanhToan();

			// Chuyển đối tượng NguoiDung từ idNguoiDung
			NguoiDung nguoiDung = new NguoiDung();
			nguoiDung.setId(idNguoiDung);
			thanhToan.setNguoiDung(nguoiDung);

			// Chuyển đối tượng KhoaHoc từ idKhoaHoc
			KhoaHoc khoaHoc = new KhoaHoc();
			khoaHoc.setId(idKhoaHoc);
			thanhToan.setKhoaHoc(khoaHoc);
			thanhToan.setTongTien(Float.valueOf(totalPrice));
			thanhToan.setThoiGian(new Date());
			thanhToan.setTrangThai(true);
			thanhToanService.save(thanhToan);

			DangKyKhoaHoc dangKyKhoaHoc = new DangKyKhoaHoc();
			dangKyKhoaHoc.setKhoaHoc(khoaHoc);
			dangKyKhoaHoc.setNguoiDung(nguoiDung);
			dangKyKhoaHoc.setNgayDangKy(new Date());
			dangKyKhoaHoc.setTienDo(String.valueOf(0));
			dangKyKhoaHoc.setTrangThai("Đang học");
			dangKyKhoaHocService.save(dangKyKhoaHoc);
		}

		model.addAttribute("orderId", orderInfo);
		model.addAttribute("totalPrice", formattedTotalAmount);
		model.addAttribute("paymentTime", formattedPaymentTime);
		model.addAttribute("Txnref", Txnref);

		return paymentStatus == 1 ? "ordersuccess" : "orderfail";
	}

}
