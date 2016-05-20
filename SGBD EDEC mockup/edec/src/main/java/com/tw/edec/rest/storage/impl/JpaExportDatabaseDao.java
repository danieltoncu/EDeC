package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.storage.ExportDatabaseDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

@Repository
public class JpaExportDatabaseDao implements ExportDatabaseDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void exportDatabase() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("export_to_csv");

        query.executeUpdate();
    }
}
