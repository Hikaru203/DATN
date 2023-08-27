package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.DienDan;

public interface DienDanRepository extends JpaRepository<DienDan, Integer> {
    // You can add custom query methods here if needed
}
