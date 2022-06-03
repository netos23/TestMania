package ru.fbtw.testmania.collection_service.service

import org.springframework.stereotype.Service
import ru.fbtw.testmania.collection_service.domain.Aspect
import ru.fbtw.testmania.collection_service.domain.AspectCollection
import ru.fbtw.testmania.collection_service.domain.DataResource
import ru.fbtw.testmania.collection_service.dto.*
import ru.fbtw.testmania.collection_service.repository.AspectCollectionRepository
import ru.fbtw.testmania.collection_service.repository.AspectRepository

@Service
class AspectService(
    val aspectRepository: AspectRepository,
    val collectionRepository: AspectCollectionRepository,
    val imageService: ImageService,
) {
    fun findAspectsByCollection(collection: AspectCollection?): ResponseAspectsList {
        collection ?: throw Exception("missing collection")

        return ResponseAspectsList(
            aspects = collection.aspects.map(Aspect::toResponseDto),
        )
    }


    fun getAspect(aspect: Aspect?): ResponseAspectDto {
        aspect ?: throw Exception("missing aspect")

        return aspect.toResponseDto()
    }

    fun addAspect(aspectDto: PostAspectDto): ResponseStatusDto {
        aspectDto.id ?: throw Exception("missing id")
        aspectDto.name ?: throw Exception("missing name")

        val resources =  aspectDto.resources.map(DataResourceDto::toEntity)
        val steppers =  aspectDto.steppers.map(StepperStepDto::toEntity)

        TODO("Not yet implemented")
    }

    fun editAspect(aspectDto: PostAspectDto): ResponseStatusDto {
        TODO("Not yet implemented")
    }

    fun deleteAspect(deleteAspectDto: DeleteAspectDto): ResponseStatusDto {
        TODO("Not yet implemented")
    }
}


