package com.kh.team2.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.CertifyVo;
import com.kh.team2.persistence.CertifyDao;

@Service
public class CertifyServiceImpl implements CertifyService {

	@Inject
	CertifyDao certifyDao;
	
	@Override
	public void certifySetKey(CertifyVo certifyVo) throws Exception {
		certifyDao.certifySetKey(certifyVo);
	}

	@Override
	public int certifyCheck(String certify_id) throws Exception {
		return certifyDao.certifyCheck(certify_id);
	}

	@Override
	public void certifyKeyUpdate(CertifyVo certifyVo) throws Exception {
		certifyDao.certifyKeyUpdate(certifyVo);
	}

	@Override
	public int certify(CertifyVo certifyVo) throws Exception {
		return certifyDao.certify(certifyVo);
	}

	@Override
	public void certifySuccess(String certify_id) throws Exception {
		certifyDao.certifySuccess(certify_id);
	}

	@Override
	public String ynCheck(String certify_id) throws Exception {
		return certifyDao.ynCheck(certify_id);
	}

	@Override
	public void deleteCertify(String certify_id) throws Exception {
		certifyDao.deleteCertify(certify_id);
	}

}
