package ru.fbtw.testmania.collection_service.dto

import ru.fbtw.testmania.collection_service.domain.Aspect
import ru.fbtw.testmania.collection_service.domain.DataResource
import ru.fbtw.testmania.collection_service.domain.StepperStep


fun Aspect.toResponseDto(): ResponseAspectDto =
    ResponseAspectDto(
        id = id,
        name = name,
        resources = resources.map(DataResource::toResponseDto).toMutableList(),
        steppers = steppers.map(StepperStep::toResponseDto).toMutableList()
    )

fun DataResource.toResponseDto(): ResponseDataResourceDto =
    ResponseDataResourceDto(
        id = id,
        name = name,
        type = type,
    )

fun StepperStep.toResponseDto(): ResponseStepperStepDto =
    ResponseStepperStepDto(
        id = id,
        stepperTag = stepperTag,
        index = index,
        dataResource = dataResource.toResponseDto()
    )

fun DataResourceDto.toEntity(): DataResource {
    val name = this.name ?: throw Exception("Missing resource name")
    val type = this.type ?: throw Exception("Missing or wrong type")

    return DataResource(
        id = id,
        name = name,
        type = type,
    )
}

fun StepperStepDto.toEntity(): StepperStep {
    val stepperTag = stepperTag ?: throw Exception("Missing resource name")
    val index = index ?: throw Exception("Missing resource name")
    val dataResource = dataResource?.toEntity() ?: throw Exception("Missing resource name")

    return StepperStep(
        id = id,
        stepperTag = stepperTag,
        index = index,
        dataResource = dataResource,
    )
}
