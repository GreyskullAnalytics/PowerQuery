let
    fnConnectToDataflow =
        (Workspace as text, Dataflow as text, Entity as text) =>
        let
            Source = PowerBI.Dataflows(null),
            Workspace_Name = Source{[workspaceName = Workspace]}[Data],
            Dataflow_Name = Workspace_Name{[dataflowName = Dataflow]}[Data],
            Entity_Name = Dataflow_Name{[entity=Entity]}[Data]
        in 
            Entity_Name,
    Documentation_Meta = [
        Documentation.Name = "Connect to a Dataflow",
        Documentation.Description = "By default when Power BI Desktop connects to a dataflow, the connection uses the dataflow's ID. " &
        "If you were to delete and then replace the dataflow, the ID is lost and any reports associated with the dataflow will break. " &
        "This function allows you to connect to a dataflow using it's name, meaning that as long as you use consistent naming conventions " &
        "you are able to delete and replace dataflows or even decide to point you report at dataflows in a different workspace. You must pass 3 parameters: " & 
        "WORKSPACE is the name of the workspace the dataflow is in, " &
        "DATAFLOW is the name of the dataflow and ENTITY is the specific table within the dataflow you wish to connect to. " &
        "It's recommended to use a parameterise to to populate the WORKSPACE parameter to allow the PBIX to pint at different workspaces " &
        "i.e. develop a report pointed to dataflows in a development workspace, and then switch the parameter to point at a production workspace once " &
        "your dataflows and report are production ready."
    ]
in
    Value.ReplaceType(
        fnConnectToDataflow,
        Value.ReplaceMetadata(
            Value.Type(fnConnectToDataflow),
            Documentation_Meta
        )
    )