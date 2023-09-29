package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.CauHoi;

public interface CauHoiRepository extends JpaRepository<CauHoi, Integer> {
    // You can add custom query methods here if needed
    List<CauHoi> findByMucLuc(int mucLuc);

}
