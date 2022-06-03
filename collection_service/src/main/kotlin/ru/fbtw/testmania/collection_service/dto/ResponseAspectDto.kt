package ru.fbtw.testmania.collection_service.dto

import java.io.Serializable

data class ResponseAspectDto(
    val id: Int? = null,
    val name: String? = null,
    val resources: MutableList<ResponseDataResourceDto> = mutableListOf(),
    val steppers: MutableList<ResponseStepperStepDto> = mutableListOf(),
) : Serializable
