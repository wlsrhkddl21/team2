package persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private static final String NAMESAPCE = "com.kh.team2.mappers.memberMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESAPCE + ".insertMember", memberVo);

	}

}
