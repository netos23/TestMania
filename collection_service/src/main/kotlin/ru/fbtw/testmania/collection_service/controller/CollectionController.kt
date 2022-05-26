package ru.fbtw.testmania.collection_service.controller

import org.springframework.web.bind.annotation.*
import ru.fbtw.testmania.collection_service.domain.AspectCollection
import ru.fbtw.testmania.collection_service.dto.DeleteCollectionDto
import ru.fbtw.testmania.collection_service.dto.PostAspectCollectionDto
import ru.fbtw.testmania.collection_service.service.CollectionService

@RestController
class CollectionController(
    val collectionService: CollectionService,
) {

    @GetMapping(value = ["/collection"])
    fun getCollectionList(
        @RequestParam(
            name = "expandAspects",
            defaultValue = "true",
        )
        expandAspects: Boolean,
    ) = collectionService.getCollectionList(expandAspects)

    @GetMapping(value = ["/collection/{id}"])
    fun getCollection(
        @PathVariable(value = "id")
        aspectCollection: AspectCollection,
    ) = collectionService.getCollection(aspectCollection)

    @PostMapping(value = ["/collection"])
    fun addCollection(
        collectionDto: PostAspectCollectionDto,
    ) = collectionService.addCollection(collectionDto)

    @PatchMapping(value = ["/collection"])
    fun editCollection(
        collectionDto: PostAspectCollectionDto,
    ) = collectionService.editCollection(collectionDto)

    @DeleteMapping(value = ["/collection"])
    fun deleteCollection(
        collectionDto: DeleteCollectionDto
    ) = collectionService.deleteCollection(collectionDto)
}