package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.mycart.entities.Category;

public class CategoryDao {
	
	public SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
	//Saves the category to DB
	public int saveCategory(Category cat) {
		Session session=this.factory.openSession();
		Transaction tx=session.beginTransaction();
		int categoryId=(int)session.save(cat);
		tx.commit();
		session.close();
		return categoryId;
	}
	public List<Category> getCategories(){
		Session s = this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list = query.list();
		return list;
 	}
	public Category getCategoryById(int cid) {
		Category cat=null;
		try {
			Session session = this.factory.openSession();
			cat=session.get(Category.class,cid);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
