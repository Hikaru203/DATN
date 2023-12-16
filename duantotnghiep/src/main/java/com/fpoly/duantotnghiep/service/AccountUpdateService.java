package com.fpoly.duantotnghiep.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.NguoiDung;

public interface AccountUpdateService {

    NguoiDung getAccountInfo(String username);

    NguoiDung updateAccountInfo(String username, NguoiDung updatedNguoiDung);

	NguoiDung getCurrentUserInfo();

	

	void updateUserInfo(String hoTen, String email, String matKhau, String soDienThoai, MultipartFile file)
			throws IOException;
}

