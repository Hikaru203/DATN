package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.CauHoi;

public interface CauHoiRepository extends JpaRepository<CauHoi, Integer> {
    // You can add custom query methods here if needed
}
