package ru.fbtw.testmania.collection_service.dto

import java.io.Serializable

data class PostAspectDto(
    val id: Int? = null,
    val name: String? = null,
    val resources: MutableList<DataResourceDto?> = mutableListOf(),
    val steppers: MutableList<StepperStepDto?> = mutableListOf(),
) : Serializable
