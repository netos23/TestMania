package ru.fbtw.testmania.collection_service.service

import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.ImportAutoConfiguration
import org.springframework.boot.test.autoconfigure.OverrideAutoConfiguration
import org.springframework.boot.test.autoconfigure.core.AutoConfigureCache
import org.springframework.boot.test.autoconfigure.filter.TypeExcludeFilters
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureDataJpa
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestEntityManager
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTypeExcludeFilter
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.transaction.annotation.Transactional
import ru.fbtw.testmania.collection_service.domain.Aspect
import ru.fbtw.testmania.collection_service.domain.AspectCollection


@OverrideAutoConfiguration(enabled = false)
@TypeExcludeFilters(DataJpaTypeExcludeFilter::class)
@Transactional
@AutoConfigureCache
@AutoConfigureDataJpa
@AutoConfigureTestDatabase
@AutoConfigureTestEntityManager
@ImportAutoConfiguration
@SpringBootTest
internal class AspectServiceTest {


    @Autowired
    private lateinit var aspectService: AspectService

    @Autowired
    private lateinit var testEntityManager: TestEntityManager

    @BeforeEach
    fun setUp() {
    }

    @AfterEach
    fun tearDown() {
    }

    @Test
    fun findAspectsByCollection() {
        val aspectList = mutableListOf(
            Aspect(null, "russia", mutableListOf(), mutableListOf()),
            Aspect(null, "usa", mutableListOf(), mutableListOf()),
            Aspect(null, "england", mutableListOf(), mutableListOf()),
        )

        val collection = AspectCollection(
            null, "flags",
            aspectList
        )

        aspectList.forEach(testEntityManager::persist)
        testEntityManager.persist(collection)
        testEntityManager.flush()

        val aspects = aspectService.findAspectsByCollection(collection)

        assert(aspects.aspects.size == aspectList.size)
        aspectList
            .zip(aspects.aspects.sortedBy { it.id })
            .forEach {
                val (expect, actual) = it

                assert(expect.id == actual.id)
                assert(expect.name == actual.name)
            }
    }

    @Test
    fun getAspect() {
    }

    @Test
    fun addAspect() {
    }

    @Test
    fun editAspect() {
    }

    @Test
    fun deleteAspect() {
    }
}