package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.NguoiDung;

public interface NguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
    // You can add custom query methods here if needed
}
