package ru.fbtw.testmania.collection_service.dto

import ru.fbtw.testmania.collection_service.domain.ResourceType
import java.io.Serializable

data class DataResourceDto(
    val id: Int? = null,
    val name: String? = null,
    val type: ResourceType? = null,
) : Serializable
