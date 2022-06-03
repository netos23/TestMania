package ru.fbtw.testmania.collection_service.service

import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.core.AutoConfigureCache
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureDataJpa
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestEntityManager
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.transaction.annotation.Transactional

@SpringBootTest
@Transactional
@AutoConfigureCache
@AutoConfigureDataJpa
@AutoConfigureTestDatabase
@AutoConfigureTestEntityManager
internal class CollectionServiceTest {


    @Autowired
    private lateinit var collectionService: CollectionService

    @Autowired
    private lateinit var testEntityManager: TestEntityManager

    @Test
    fun getCollectionList() {
    }

    @Test
    fun getCollection() {
    }

    @Test
    fun addCollection() {
    }

    @Test
    fun editCollection() {
    }

    @Test
    fun deleteCollection() {
    }
}