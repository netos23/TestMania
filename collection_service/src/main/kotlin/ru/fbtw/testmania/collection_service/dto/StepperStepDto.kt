package ru.fbtw.testmania.collection_service.dto

import java.io.Serializable

data class StepperStepDto(
    val id: Int? = null,
    val stepperTag: Int? = null,
    val index: Int? = null,
    val dataResourceId: MutableList<DataResourceDto?> = mutableListOf(),
) : Serializable
