package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.ChungChi;

public interface ChungChiRepository extends JpaRepository<ChungChi, Integer> {
    // You can add custom query methods here if needed
}
