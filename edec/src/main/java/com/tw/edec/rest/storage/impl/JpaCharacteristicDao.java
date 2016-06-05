package com.tw.edec.rest.storage.impl;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.storage.CharacteristicDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class JpaCharacteristicDao implements CharacteristicDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    @Override
    public void addCharacteristic(Characteristic characteristic) {
        entityManager.persist(characteristic);
    }

    @Transactional
    @Override
    public void removeCharacteristic(Characteristic characteristic) {
        entityManager.remove(characteristic);
    }

    @Override
    public Characteristic getById(Long characteristicId) {
        TypedQuery<Characteristic> q=entityManager.createQuery("select c from Characteristic c where c.id=:characteristicId",Characteristic.class);
        q.setParameter("characteristicId",characteristicId);

        return q.getSingleResult();
    }

    @Override
    public Characteristic getByName(String characteristicName) {
        TypedQuery<Characteristic> q=entityManager.createQuery("select c from Characteristic c where c.name=:characteristicName",Characteristic.class);
        q.setParameter("characteristicName",characteristicName);

        return q.getSingleResult();
    }

    @Override
    public List<Characteristic> getAll() {
        TypedQuery<Characteristic> q=entityManager.createQuery("select c from Characteristic c",Characteristic.class);

        return q.getResultList();
    }

    @Override
    public List<Characteristic> getWithPagination(String pag, int recordsPerPage) {
        TypedQuery<Characteristic> query=entityManager.createQuery("select c from Characteristic c",Characteristic.class);

        int firstResult = (Integer.parseInt(pag) - 1) * recordsPerPage;
        query.setFirstResult(firstResult);
        query.setMaxResults(recordsPerPage);

        return query.getResultList();
    }

    @Override
    public List<Characteristic> getTopLiked() {
        TypedQuery<Characteristic> q=entityManager.createQuery("select c from Characteristic c order by c.nrLikes DESC",Characteristic.class);
        q.setMaxResults(10);
        return q.getResultList();
    }

    @Override
    public List<Characteristic> getTopDisliked() {
        TypedQuery<Characteristic> q=entityManager.createQuery("select c from Characteristic c order by c.nrDislikes DESC",Characteristic.class);
        q.setMaxResults(10);
        return q.getResultList();
    }
}
