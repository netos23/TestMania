package ru.fbtw.testmania.collection_service.service

import org.springframework.stereotype.Service
import ru.fbtw.testmania.collection_service.domain.Aspect
import ru.fbtw.testmania.collection_service.domain.AspectCollection
import ru.fbtw.testmania.collection_service.dto.DeleteAspectDto
import ru.fbtw.testmania.collection_service.dto.PostAspectDto

@Service
class AspectService {
    fun findAspectsByCollection(collection: AspectCollection): Any {
        TODO("Not yet implemented")
    }

    fun getAspect(aspect: Aspect): Any {
        TODO("Not yet implemented")
    }

    fun addAspect(aspectDto: PostAspectDto): Any {
        TODO("Not yet implemented")
    }

    fun editAspect(aspectDto: PostAspectDto): Any {
        TODO("Not yet implemented")
    }

    fun deleteAspect(deleteAspectDto: DeleteAspectDto): Any {
        TODO("Not yet implemented")
    }
}