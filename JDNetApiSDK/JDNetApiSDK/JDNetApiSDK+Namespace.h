// Namespaced Header
#ifndef __NS_SYMBOL
// We need to have multiple levels of macros here so that __NAMESPACE_PREFIX_ is
// properly replaced by the time we concatenate the namespace prefix.
#define __NS_REWRITE(ns, symbol) ns ## _ ## symbol
#define __NS_BRIDGE(ns, symbol) __NS_REWRITE(ns, symbol)
#define __NS_SYMBOL(symbol) __NS_BRIDGE(JDNetApiSDK, symbol)
#endif

// Classes
#ifndef AFActivityIndicatorViewNotificationObserver
#define AFActivityIndicatorViewNotificationObserver __NS_SYMBOL(AFActivityIndicatorViewNotificationObserver)
#endif

#ifndef AFAutoPurgingImageCache
#define AFAutoPurgingImageCache __NS_SYMBOL(AFAutoPurgingImageCache)
#endif

#ifndef AFCachedImage
#define AFCachedImage __NS_SYMBOL(AFCachedImage)
#endif

#ifndef AFCompoundResponseSerializer
#define AFCompoundResponseSerializer __NS_SYMBOL(AFCompoundResponseSerializer)
#endif

#ifndef AFHTTPBodyPart
#define AFHTTPBodyPart __NS_SYMBOL(AFHTTPBodyPart)
#endif

#ifndef AFHTTPRequestSerializer
#define AFHTTPRequestSerializer __NS_SYMBOL(AFHTTPRequestSerializer)
#endif

#ifndef AFHTTPResponseSerializer
#define AFHTTPResponseSerializer __NS_SYMBOL(AFHTTPResponseSerializer)
#endif

#ifndef AFHTTPSessionManager
#define AFHTTPSessionManager __NS_SYMBOL(AFHTTPSessionManager)
#endif

#ifndef AFImageDownloadReceipt
#define AFImageDownloadReceipt __NS_SYMBOL(AFImageDownloadReceipt)
#endif

#ifndef AFImageDownloader
#define AFImageDownloader __NS_SYMBOL(AFImageDownloader)
#endif

#ifndef AFImageDownloaderMergedTask
#define AFImageDownloaderMergedTask __NS_SYMBOL(AFImageDownloaderMergedTask)
#endif

#ifndef AFImageDownloaderResponseHandler
#define AFImageDownloaderResponseHandler __NS_SYMBOL(AFImageDownloaderResponseHandler)
#endif

#ifndef AFImageResponseSerializer
#define AFImageResponseSerializer __NS_SYMBOL(AFImageResponseSerializer)
#endif

#ifndef AFJSONRequestSerializer
#define AFJSONRequestSerializer __NS_SYMBOL(AFJSONRequestSerializer)
#endif

#ifndef AFJSONResponseSerializer
#define AFJSONResponseSerializer __NS_SYMBOL(AFJSONResponseSerializer)
#endif

#ifndef AFMultipartBodyStream
#define AFMultipartBodyStream __NS_SYMBOL(AFMultipartBodyStream)
#endif

#ifndef AFNetworkActivityIndicatorManager
#define AFNetworkActivityIndicatorManager __NS_SYMBOL(AFNetworkActivityIndicatorManager)
#endif

#ifndef AFNetworkReachabilityManager
#define AFNetworkReachabilityManager __NS_SYMBOL(AFNetworkReachabilityManager)
#endif

#ifndef AFPropertyListRequestSerializer
#define AFPropertyListRequestSerializer __NS_SYMBOL(AFPropertyListRequestSerializer)
#endif

#ifndef AFPropertyListResponseSerializer
#define AFPropertyListResponseSerializer __NS_SYMBOL(AFPropertyListResponseSerializer)
#endif

#ifndef AFQueryStringPair
#define AFQueryStringPair __NS_SYMBOL(AFQueryStringPair)
#endif

#ifndef AFRefreshControlNotificationObserver
#define AFRefreshControlNotificationObserver __NS_SYMBOL(AFRefreshControlNotificationObserver)
#endif

#ifndef AFSecurityPolicy
#define AFSecurityPolicy __NS_SYMBOL(AFSecurityPolicy)
#endif

#ifndef AFStreamingMultipartFormData
#define AFStreamingMultipartFormData __NS_SYMBOL(AFStreamingMultipartFormData)
#endif

#ifndef AFURLSessionManager
#define AFURLSessionManager __NS_SYMBOL(AFURLSessionManager)
#endif

#ifndef AFURLSessionManagerTaskDelegate
#define AFURLSessionManagerTaskDelegate __NS_SYMBOL(AFURLSessionManagerTaskDelegate)
#endif

#ifndef AFXMLParserResponseSerializer
#define AFXMLParserResponseSerializer __NS_SYMBOL(AFXMLParserResponseSerializer)
#endif

#ifndef GYHttpClientHook
#define GYHttpClientHook __NS_SYMBOL(GYHttpClientHook)
#endif

#ifndef GYHttpMock
#define GYHttpMock __NS_SYMBOL(GYHttpMock)
#endif

#ifndef GYMatcher
#define GYMatcher __NS_SYMBOL(GYMatcher)
#endif

#ifndef GYMockRequest
#define GYMockRequest __NS_SYMBOL(GYMockRequest)
#endif

#ifndef GYMockRequestDSL
#define GYMockRequestDSL __NS_SYMBOL(GYMockRequestDSL)
#endif

#ifndef GYMockResponse
#define GYMockResponse __NS_SYMBOL(GYMockResponse)
#endif

#ifndef GYMockResponseDSL
#define GYMockResponseDSL __NS_SYMBOL(GYMockResponseDSL)
#endif

#ifndef GYMockURLProtocol
#define GYMockURLProtocol __NS_SYMBOL(GYMockURLProtocol)
#endif

#ifndef GYNSURLHook
#define GYNSURLHook __NS_SYMBOL(GYNSURLHook)
#endif

#ifndef GYNSURLSessionHook
#define GYNSURLSessionHook __NS_SYMBOL(GYNSURLSessionHook)
#endif

#ifndef JDNetApiSDKVendor
#define JDNetApiSDKVendor __NS_SYMBOL(JDNetApiSDKVendor)
#endif

#ifndef YYClassInfo
#define YYClassInfo __NS_SYMBOL(YYClassInfo)
#endif

#ifndef YYClassIvarInfo
#define YYClassIvarInfo __NS_SYMBOL(YYClassIvarInfo)
#endif

#ifndef YYClassMethodInfo
#define YYClassMethodInfo __NS_SYMBOL(YYClassMethodInfo)
#endif

#ifndef YYClassPropertyInfo
#define YYClassPropertyInfo __NS_SYMBOL(YYClassPropertyInfo)
#endif

#ifndef _AFURLSessionTaskSwizzling
#define _AFURLSessionTaskSwizzling __NS_SYMBOL(_AFURLSessionTaskSwizzling)
#endif

#ifndef _YYModelMeta
#define _YYModelMeta __NS_SYMBOL(_YYModelMeta)
#endif

#ifndef _YYModelPropertyMeta
#define _YYModelPropertyMeta __NS_SYMBOL(_YYModelPropertyMeta)
#endif

// Functions
#ifndef AFPercentEscapedStringFromString
#define AFPercentEscapedStringFromString __NS_SYMBOL(AFPercentEscapedStringFromString)
#endif

#ifndef AFStringFromNetworkReachabilityStatus
#define AFStringFromNetworkReachabilityStatus __NS_SYMBOL(AFStringFromNetworkReachabilityStatus)
#endif

#ifndef YYEncodingGetType
#define YYEncodingGetType __NS_SYMBOL(YYEncodingGetType)
#endif

#ifndef AFQueryStringFromParameters
#define AFQueryStringFromParameters __NS_SYMBOL(AFQueryStringFromParameters)
#endif

#ifndef AFQueryStringPairsFromDictionary
#define AFQueryStringPairsFromDictionary __NS_SYMBOL(AFQueryStringPairsFromDictionary)
#endif

#ifndef AFQueryStringPairsFromKeyAndValue
#define AFQueryStringPairsFromKeyAndValue __NS_SYMBOL(AFQueryStringPairsFromKeyAndValue)
#endif

#ifndef mockRequest
#define mockRequest __NS_SYMBOL(mockRequest)
#endif

// Externs
#ifndef GYHTTPRequest
#define GYHTTPRequest __NS_SYMBOL(GYHTTPRequest)
#endif

#ifndef AFImageCache
#define AFImageCache __NS_SYMBOL(AFImageCache)
#endif

#ifndef AFImageRequestCache
#define AFImageRequestCache __NS_SYMBOL(AFImageRequestCache)
#endif

#ifndef AFURLResponseSerialization
#define AFURLResponseSerialization __NS_SYMBOL(AFURLResponseSerialization)
#endif

#ifndef AFURLRequestSerialization
#define AFURLRequestSerialization __NS_SYMBOL(AFURLRequestSerialization)
#endif

#ifndef AFMultipartFormData
#define AFMultipartFormData __NS_SYMBOL(AFMultipartFormData)
#endif

#ifndef JDNetApiSDKVendorVersionString
#define JDNetApiSDKVendorVersionString __NS_SYMBOL(JDNetApiSDKVendorVersionString)
#endif

#ifndef JDNetApiSDKVendorVersionNumber
#define JDNetApiSDKVendorVersionNumber __NS_SYMBOL(JDNetApiSDKVendorVersionNumber)
#endif

#ifndef AFNetworkingReachabilityDidChangeNotification
#define AFNetworkingReachabilityDidChangeNotification __NS_SYMBOL(AFNetworkingReachabilityDidChangeNotification)
#endif

#ifndef AFNetworkingReachabilityNotificationStatusItem
#define AFNetworkingReachabilityNotificationStatusItem __NS_SYMBOL(AFNetworkingReachabilityNotificationStatusItem)
#endif

#ifndef AFURLResponseSerializationErrorDomain
#define AFURLResponseSerializationErrorDomain __NS_SYMBOL(AFURLResponseSerializationErrorDomain)
#endif

#ifndef AFNetworkingOperationFailingURLResponseErrorKey
#define AFNetworkingOperationFailingURLResponseErrorKey __NS_SYMBOL(AFNetworkingOperationFailingURLResponseErrorKey)
#endif

#ifndef AFNetworkingOperationFailingURLResponseDataErrorKey
#define AFNetworkingOperationFailingURLResponseDataErrorKey __NS_SYMBOL(AFNetworkingOperationFailingURLResponseDataErrorKey)
#endif

#ifndef AFNetworkingTaskDidResumeNotification
#define AFNetworkingTaskDidResumeNotification __NS_SYMBOL(AFNetworkingTaskDidResumeNotification)
#endif

#ifndef AFNetworkingTaskDidCompleteNotification
#define AFNetworkingTaskDidCompleteNotification __NS_SYMBOL(AFNetworkingTaskDidCompleteNotification)
#endif

#ifndef AFNetworkingTaskDidSuspendNotification
#define AFNetworkingTaskDidSuspendNotification __NS_SYMBOL(AFNetworkingTaskDidSuspendNotification)
#endif

#ifndef AFURLSessionDidInvalidateNotification
#define AFURLSessionDidInvalidateNotification __NS_SYMBOL(AFURLSessionDidInvalidateNotification)
#endif

#ifndef AFURLSessionDownloadTaskDidFailToMoveFileNotification
#define AFURLSessionDownloadTaskDidFailToMoveFileNotification __NS_SYMBOL(AFURLSessionDownloadTaskDidFailToMoveFileNotification)
#endif

#ifndef AFNetworkingTaskDidCompleteSerializedResponseKey
#define AFNetworkingTaskDidCompleteSerializedResponseKey __NS_SYMBOL(AFNetworkingTaskDidCompleteSerializedResponseKey)
#endif

#ifndef AFNetworkingTaskDidCompleteResponseSerializerKey
#define AFNetworkingTaskDidCompleteResponseSerializerKey __NS_SYMBOL(AFNetworkingTaskDidCompleteResponseSerializerKey)
#endif

#ifndef AFNetworkingTaskDidCompleteResponseDataKey
#define AFNetworkingTaskDidCompleteResponseDataKey __NS_SYMBOL(AFNetworkingTaskDidCompleteResponseDataKey)
#endif

#ifndef AFNetworkingTaskDidCompleteErrorKey
#define AFNetworkingTaskDidCompleteErrorKey __NS_SYMBOL(AFNetworkingTaskDidCompleteErrorKey)
#endif

#ifndef AFNetworkingTaskDidCompleteAssetPathKey
#define AFNetworkingTaskDidCompleteAssetPathKey __NS_SYMBOL(AFNetworkingTaskDidCompleteAssetPathKey)
#endif

#ifndef AFURLRequestSerializationErrorDomain
#define AFURLRequestSerializationErrorDomain __NS_SYMBOL(AFURLRequestSerializationErrorDomain)
#endif

#ifndef AFNetworkingOperationFailingURLRequestErrorKey
#define AFNetworkingOperationFailingURLRequestErrorKey __NS_SYMBOL(AFNetworkingOperationFailingURLRequestErrorKey)
#endif

#ifndef kAFUploadStream3GSuggestedPacketSize
#define kAFUploadStream3GSuggestedPacketSize __NS_SYMBOL(kAFUploadStream3GSuggestedPacketSize)
#endif

#ifndef kAFUploadStream3GSuggestedDelay
#define kAFUploadStream3GSuggestedDelay __NS_SYMBOL(kAFUploadStream3GSuggestedDelay)
#endif

