// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview
{
    using static Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.Extensions;

    /// <summary>The response from the List Application Groups operation.</summary>
    [Microsoft.Azure.PowerShell.Cmdlets.EventHub.DoNotFormat]
    public partial class ApplicationGroupListResult :
        Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroupListResult,
        Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroupListResultInternal
    {

        /// <summary>Internal Acessors for NextLink</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroupListResultInternal.NextLink { get => this._nextLink; set { {_nextLink = value;} } }

        /// <summary>Backing field for <see cref="NextLink" /> property.</summary>
        private string _nextLink;

        /// <summary>
        /// Link to the next set of results. Not empty if Value contains an incomplete list of Authorization Rules
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Origin(Microsoft.Azure.PowerShell.Cmdlets.EventHub.PropertyOrigin.Owned)]
        public string NextLink { get => this._nextLink; }

        /// <summary>Backing field for <see cref="Value" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroup[] _value;

        /// <summary>Result of the List Application Groups operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Origin(Microsoft.Azure.PowerShell.Cmdlets.EventHub.PropertyOrigin.Owned)]
        public Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroup[] Value { get => this._value; set => this._value = value; }

        /// <summary>Creates an new <see cref="ApplicationGroupListResult" /> instance.</summary>
        public ApplicationGroupListResult()
        {

        }
    }
    /// The response from the List Application Groups operation.
    public partial interface IApplicationGroupListResult :
        Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.IJsonSerializable
    {
        /// <summary>
        /// Link to the next set of results. Not empty if Value contains an incomplete list of Authorization Rules
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Description = @"Link to the next set of results. Not empty if Value contains an incomplete list of Authorization Rules",
        SerializedName = @"nextLink",
        PossibleTypes = new [] { typeof(string) })]
        string NextLink { get;  }
        /// <summary>Result of the List Application Groups operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"Result of the List Application Groups operation.",
        SerializedName = @"value",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroup) })]
        Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroup[] Value { get; set; }

    }
    /// The response from the List Application Groups operation.
    internal partial interface IApplicationGroupListResultInternal

    {
        /// <summary>
        /// Link to the next set of results. Not empty if Value contains an incomplete list of Authorization Rules
        /// </summary>
        string NextLink { get; set; }
        /// <summary>Result of the List Application Groups operation.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.Api202301Preview.IApplicationGroup[] Value { get; set; }

    }
}