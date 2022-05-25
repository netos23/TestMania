package ru.fbtw.testmania.collection_service.repository;

import org.springframework.data.jpa.repository.JpaRepository
import ru.fbtw.testmania.collection_service.domain.DataResource

interface DataResourceRepository : JpaRepository<DataResource, Int> {
}