package com.fpoly.duantotnghiep.jparepository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.fpoly.duantotnghiep.Entity.NguoiDung;

public interface NguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
    List<NguoiDung> findById(int idNguoiDung);
}
