// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.Api20230401
{
    using static Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.Extensions;

    /// <summary>Project details.</summary>
    public partial class Project :
        Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.Api20230401.IProject,
        Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.Api20230401.IProjectInternal
    {

        /// <summary>Backing field for <see cref="Description" /> property.</summary>
        private string _description;

        /// <summary>Description of the project.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Origin(Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.PropertyOrigin.Owned)]
        public string Description { get => this._description; set => this._description = value; }

        /// <summary>Backing field for <see cref="MaxDevBoxesPerUser" /> property.</summary>
        private int? _maxDevBoxesPerUser;

        /// <summary>
        /// When specified, indicates the maximum number of Dev Boxes a single user can create across all pools in the project.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Origin(Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.PropertyOrigin.Owned)]
        public int? MaxDevBoxesPerUser { get => this._maxDevBoxesPerUser; set => this._maxDevBoxesPerUser = value; }

        /// <summary>Backing field for <see cref="Name" /> property.</summary>
        private string _name;

        /// <summary>Name of the project</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Origin(Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.PropertyOrigin.Owned)]
        public string Name { get => this._name; set => this._name = value; }

        /// <summary>Creates an new <see cref="Project" /> instance.</summary>
        public Project()
        {

        }
    }
    /// Project details.
    public partial interface IProject :
        Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.IJsonSerializable
    {
        /// <summary>Description of the project.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"Description of the project.",
        SerializedName = @"description",
        PossibleTypes = new [] { typeof(string) })]
        string Description { get; set; }
        /// <summary>
        /// When specified, indicates the maximum number of Dev Boxes a single user can create across all pools in the project.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"When specified, indicates the maximum number of Dev Boxes a single user can create across all pools in the project.",
        SerializedName = @"maxDevBoxesPerUser",
        PossibleTypes = new [] { typeof(int) })]
        int? MaxDevBoxesPerUser { get; set; }
        /// <summary>Name of the project</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.Info(
        Required = true,
        ReadOnly = false,
        Description = @"Name of the project",
        SerializedName = @"name",
        PossibleTypes = new [] { typeof(string) })]
        string Name { get; set; }

    }
    /// Project details.
    internal partial interface IProjectInternal

    {
        /// <summary>Description of the project.</summary>
        string Description { get; set; }
        /// <summary>
        /// When specified, indicates the maximum number of Dev Boxes a single user can create across all pools in the project.
        /// </summary>
        int? MaxDevBoxesPerUser { get; set; }
        /// <summary>Name of the project</summary>
        string Name { get; set; }

    }
}