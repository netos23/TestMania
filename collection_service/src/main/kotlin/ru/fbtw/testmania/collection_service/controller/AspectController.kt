package ru.fbtw.testmania.collection_service.controller

import org.springframework.web.bind.annotation.*
import ru.fbtw.testmania.collection_service.domain.Aspect
import ru.fbtw.testmania.collection_service.domain.AspectCollection
import ru.fbtw.testmania.collection_service.dto.DeleteAspectDto
import ru.fbtw.testmania.collection_service.dto.PostAspectDto
import ru.fbtw.testmania.collection_service.service.AspectService

@RestController
class AspectController(
    val aspectService: AspectService
) {

    @GetMapping(value = ["/aspects/{collection_id}"])
    fun findAspectsByCollection(
        @PathVariable("collection_id") collection: AspectCollection
    ) = aspectService.findAspectsByCollection(collection)

    @GetMapping(value = ["/aspect/{id}"])
    fun getAspect(
        @PathVariable(value = "id")
        aspect: Aspect,
    ) = aspectService.getAspect(aspect)

    @PostMapping(value = ["/aspect"])
    fun addAspect(
        aspectDto: PostAspectDto,
    ) = aspectService.addAspect(aspectDto)

    @PatchMapping(value = ["/aspect"])
    fun editAspect(
        aspectDto: PostAspectDto,
    ) = aspectService.editAspect(aspectDto)

    @DeleteMapping(value = ["/aspect"])
    fun deleteAspect(
        deleteAspectDto: DeleteAspectDto
    ) = aspectService.deleteAspect(deleteAspectDto)
}