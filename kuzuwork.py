import kuzu


if __name__ == "__main__":
    db = kuzu.Database('./kuzudb_elt')

    conn = kuzu.Connection(db)

    load_json_extension = """
    
    INSTALL json;
    LOAD EXTENSION json;
    """

    conn.execute(load_json_extension)

    SHOW_EDGE_TABLES = """
    CALL SHOW_TABLES() WHERE type='REL' RETURN *;
    """
    result_set = conn.execute(SHOW_EDGE_TABLES)
    while result_set.has_next():
        table_name = result_set.get_next()[0]
        print(f"DROPPING {table_name}")
        conn.execute(f"DROP TABLE {table_name};")

    result_set.close()

    SHOW_NODE_TABLES = """
    CALL SHOW_TABLES() WHERE type='NODE' RETURN *;
    """
    result_set = conn.execute(SHOW_NODE_TABLES)
    while result_set.has_next():
        table_name = result_set.get_next()[0]
        print(f"DROPPING {table_name}")
        conn.execute(f"DROP TABLE {table_name};")

    result_set.close()

    with open('dml_statements/elt_kuzudb_node_schema.sql') as f:
        creation_lines = [line for line in f]

    with open('dml_statements/elt_kuzudb_node_import.sql') as f:
        import_lines = [line for line in f]
        

    #do not forget the primary keys for seeds

        
    for line in creation_lines:
        print(f"Executing statement {line}")
        conn.execute(line)

    for line in import_lines:
        print(f"Executing statement {line}")
        conn.execute(line)


    with open('dml_statements/elt_kuzudb_rel_schema.sql') as f:
        creation_lines = [line for line in f]

    with open('dml_statements/elt_kuzudb_rel_import.sql') as f:
        import_lines = [line for line in f]
        

    #do not forget the primary keys for seeds

        
    for line in creation_lines:
        print(f"Executing statement {line}")
        conn.execute(line)

    for line in import_lines:
        print(f"Executing statement {line}")
        conn.execute(line)