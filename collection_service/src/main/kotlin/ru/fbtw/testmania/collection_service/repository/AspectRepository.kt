package ru.fbtw.testmania.collection_service.repository;

import org.springframework.data.jpa.repository.JpaRepository
import ru.fbtw.testmania.collection_service.domain.Aspect

interface AspectRepository : JpaRepository<Aspect, Int> {
}