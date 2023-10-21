package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.NguoiDung;

public interface NguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
    // You can add custom query methods here if needed
    NguoiDung findByHoTen(String hoTen);

    NguoiDung findByTaiKhoan(String taiKhoan);

    NguoiDung findByEmail(String email);
}
