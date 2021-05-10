package com.sbs.example.textboard.service;

import com.sbs.example.textboard.Container;
import com.sbs.example.textboard.dao.MemberDao;
import com.sbs.example.textboard.dto.Member;
import com.sbs.example.textboard.util.util;

public class MemberService {

	private MemberDao memberDao;

	public MemberService() {
		memberDao = Container.memberDao;
	}

	public boolean isLoginIdDup(String loginId) {
		return memberDao.isLoginIdDup(loginId);
	}

	public int join(String loginId, String loginPw, String name) {
		return memberDao.join(loginId, util.sha256(loginPw), name);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}

}
