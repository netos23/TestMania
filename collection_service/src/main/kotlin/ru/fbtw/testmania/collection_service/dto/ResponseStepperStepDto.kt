package ru.fbtw.testmania.collection_service.dto

import java.io.Serializable

data class ResponseStepperStepDto(
    val id: Int? = null,
    val stepperTag: Int? = null,
    val index: Int? = null,
    val dataResource: ResponseDataResourceDto? = null
) : Serializable
