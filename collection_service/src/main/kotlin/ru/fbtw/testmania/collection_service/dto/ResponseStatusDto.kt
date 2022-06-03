package ru.fbtw.testmania.collection_service.dto

import java.time.LocalDateTime

data class ResponseStatusDto(
    val code: Int?,
    val message: String?,
    val timestamp: LocalDateTime?,
    val cause: String?,
) {
    companion object {
        fun ok(): ResponseStatusDto = ResponseStatusDto(
            code = 200,
            message = "ok",
            timestamp = LocalDateTime.now(),
            cause = null
        )

        fun notFound(resource: String?, cause: String?): ResponseStatusDto = ResponseStatusDto(
            code = 404,
            message = "not found $resource",
            timestamp = LocalDateTime.now(),
            cause = cause
        )

        fun badRequest(reason: String?, cause: String?): ResponseStatusDto = ResponseStatusDto(
            code = 400,
            message = "bad request $reason",
            timestamp = LocalDateTime.now(),
            cause = cause
        )
        fun forbidden(reason: String?, cause: String?): ResponseStatusDto = ResponseStatusDto(
            code = 403,
            message = "forbidden $reason",
            timestamp = LocalDateTime.now(),
            cause = cause
        )
        fun internalServerError(reason: String?, cause: String?): ResponseStatusDto = ResponseStatusDto(
            code = 500,
            message = "internal server error $reason",
            timestamp = LocalDateTime.now(),
            cause = cause
        )
    }
}
