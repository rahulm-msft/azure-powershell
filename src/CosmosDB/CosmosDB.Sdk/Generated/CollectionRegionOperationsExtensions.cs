// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.
namespace Microsoft.Azure.Management.CosmosDB
{
    using Microsoft.Rest.Azure;
    using Models;

    /// <summary>
    /// Extension methods for CollectionRegionOperations
    /// </summary>
    public static partial class CollectionRegionOperationsExtensions
    {
        /// <summary>
        /// Retrieves the metrics determined by the given filter for the given database account, collection and region.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group. The name is case insensitive.
        /// </param>
        /// <param name='accountName'>
        /// Cosmos DB database account name.
        /// </param>
        /// <param name='region'>
        /// Cosmos DB region, with spaces between words and each word capitalized.
        /// </param>
        /// <param name='databaseRid'>
        /// Cosmos DB database rid.
        /// </param>
        /// <param name='collectionRid'>
        /// Cosmos DB collection rid.
        /// </param>
        /// <param name='filter'>
        /// An OData filter expression that describes a subset of metrics to return. The parameters that can be filtered are name.value (name of the metric, can have an or of multiple names), startTime, endTime, and timeGrain. The supported operator is eq.
        /// </param>
        public static System.Collections.Generic.IEnumerable<Metric> ListMetrics(this ICollectionRegionOperations operations, string resourceGroupName, string accountName, string region, string databaseRid, string collectionRid, string filter)
        {
                return ((ICollectionRegionOperations)operations).ListMetricsAsync(resourceGroupName, accountName, region, databaseRid, collectionRid, filter).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Retrieves the metrics determined by the given filter for the given database account, collection and region.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group. The name is case insensitive.
        /// </param>
        /// <param name='accountName'>
        /// Cosmos DB database account name.
        /// </param>
        /// <param name='region'>
        /// Cosmos DB region, with spaces between words and each word capitalized.
        /// </param>
        /// <param name='databaseRid'>
        /// Cosmos DB database rid.
        /// </param>
        /// <param name='collectionRid'>
        /// Cosmos DB collection rid.
        /// </param>
        /// <param name='filter'>
        /// An OData filter expression that describes a subset of metrics to return. The parameters that can be filtered are name.value (name of the metric, can have an or of multiple names), startTime, endTime, and timeGrain. The supported operator is eq.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<Metric>> ListMetricsAsync(this ICollectionRegionOperations operations, string resourceGroupName, string accountName, string region, string databaseRid, string collectionRid, string filter, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.ListMetricsWithHttpMessagesAsync(resourceGroupName, accountName, region, databaseRid, collectionRid, filter, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
    }
}
