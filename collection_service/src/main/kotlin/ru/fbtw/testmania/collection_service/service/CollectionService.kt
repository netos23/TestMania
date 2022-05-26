package ru.fbtw.testmania.collection_service.service

import org.springframework.stereotype.Service
import ru.fbtw.testmania.collection_service.domain.AspectCollection
import ru.fbtw.testmania.collection_service.dto.DeleteCollectionDto
import ru.fbtw.testmania.collection_service.dto.PostAspectCollectionDto

@Service
class CollectionService {
    fun getCollectionList(expandAspects: Boolean) : Any{
        TODO("Not yet implemented")
    }

    fun getCollection(aspectCollection: AspectCollection): Any {
        TODO("Not yet implemented")
    }

    fun addCollection(collectionDto: PostAspectCollectionDto): Any {
        TODO("Not yet implemented")
    }

    fun editCollection(collectionDto: PostAspectCollectionDto): Any {
        TODO("Not yet implemented")
    }

    fun deleteCollection(collectionDto: DeleteCollectionDto): Any {
        TODO("Not yet implemented")
    }
}