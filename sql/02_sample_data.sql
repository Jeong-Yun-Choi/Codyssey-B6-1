-- 사이버웨어 슬롯 샘플 데이터(부모 테이블)
INSERT INTO cyberware_slot (
    slot_name, max_equip_count
)
-- 게임 화면 기준 시계방향 순서대로
-- 방어력 증가 옵션이 붙은 사이버웨어 슬롯 : 외피시스템, 골격, 다리
VALUES 
    ('운영체제', 1),
    ('얼굴', 2),
    ('손', 2),
    ('순환계', 3),
    ('다리', 1),
    ('외피 시스템', 3),
    ('신경계', 3),
    ('골격', 3),
    ('팔', 1),
    ('전두피질', 3);


-- 사이버웨어 테이블 샘플 데이터
-- cyberware_name 컬럼 : 사이버웨어 이름, quality 컬럼 : 사이버웨어 등급,
-- capacity 컬럼 : 각 사이버웨어 장착 시 차지하는 용량 크기,
-- defense_bonus 컬럼 : 사이버웨어 장착 시 방어력 추가 수치
-- slot_id 컬럼 : 외래키, cyberware_slot의 기본키
INSERT INTO cyberware
    (cyberware_name, quality, capacity, defense_bonus, slot_id)
    VALUES
    -- 얼굴
    (
        '키로시 "코카트리스" 안구', 4, 30, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '얼굴')
    ),
    (
        '키로시 "신탁" 안구', 5, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '얼굴')
    ),
    (
        '키로시 "스토커" 안구', 4, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '얼굴')
    ),
    (
        '키로시 "보초병" 안구', 3, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '얼굴')
    ),
    -- 전두피질
    (
        '엑스-디스크', 3, 10, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '메카트로닉 코어', 2, 5, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '아홀로틀', 5, 48, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '뉴튼 모듈', 2, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '램 업그레이드', 3, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '메모리 부스트', 4, 18, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    (
        '카밀로 램 매니저', 5, 10, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '전두피질')
    ),
    -- 순환계
    (  
        '혈액 펌프', 3, 15, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '순환계')
    ),
    (
        '힐-온-킬', 5, 10, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = "순환계")
    ),
    (
        '아드레날린 부스터', 3, 14, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = "순환계")
    ),
    (
        '바이오 모니터', 4, 14, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '순환계')
    ),
    (
        '두번째 심장', 5, 30, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '순환계')
    ),
    (
        '바이오 전도체', 5, 16, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '순환계')
    ),
    (
        '블랙 맘바', 3, 16, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '순환계')
    ),
    -- 신경계
    (
        '네오섬유', 4, 14, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    (
        '딥 필드 비쥬얼 인터페이스', 1, 40, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    (
        '케렌지코프', 4, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    (
        '케렌지코프 부스트 시스템', 5, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    (
        '타이로신 주사기', 3, 5, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    (
        '시냅틱 가속기', 4, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '신경계')
    ),
    -- 외피 시스템
    (
        '페인듀서', 4, 30, 114,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '외피 시스템')
    ),
    (
        '디펜지코프', 5, 25, 108,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '외피 시스템')
    ),
    (
        '옵티컬 카모', 3, 20, 25,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '외피 시스템')
    ),
    (
        '쇼크-앤-어', 4, 14, 20,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '외피 시스템')
    ),
    (
        '열 변환기', 3, 12, 15,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '외피 시스템')
    ),
    -- 운영체제
    (
        '테트라토닉 리플러 MK.5', 5, 16, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '운영체제')
    ),
    (
        '밀리테크 팔콘 산데비스탄', 4, 20, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '운영체제')
    ),
    (
        '아라사카 섀도', 5, 18, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '운영체제')
    ),
    (
        '밀리테크 칸토 MK.6', 5, 32, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '운영체제')
    ),
    (
        '무어 테크 버서크', 4, 16, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '운영체제')
    ),
    -- 골격
    (
        '고밀도 골수', 5, 16, 92,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '스프링 연결부', 2, 16, 22,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '에피모픽 스켈레톤', 5, 40, 250,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '티타늄 뼈', 3, 8, 20,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '키네틱 프레임', 5, 16, 35,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '바이오닉 관절', 4, 12, 20,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    (
        '흉터 융합기', 3, 12, 25,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '골격')
    ),
    -- 손
    (
        '스마트 링크', 3, 4, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '손')
    ),
    (
        '충격 흡수기', 4, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '손')
    ),
    (
        '움직이지 않는 힘', 5, 35, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '손')
    ),
    -- 팔
    (
        '고릴라 팔', 4, 20, 15,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '팔')
    ),
    (
        '맥스택 맨티스 블레이드', 5, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '팔')
    ),
    (
        '켄다치 모노와이어', 4, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '팔')
    ),
    (
        '투사체 발사 시스템', 4, 20, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '팔')
    ),
    -- 다리
    (
        '강화 힘줄', 3, 8, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '다리')
    ),
    (
        '강화 발목', 4, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '다리')
    ),
    (
        '린스 포', 3, 12, 0,
        (SELECT slot_id FROM cyberware_slot WHERE slot_name = '다리')
    );


-- 빌드 테이블 샘플 데이터
INSERT INTO build
    (build_name, build_type)
VALUES
    ('스텔스 러너', '잠입/암살'),
    ('트리플 리볼버', '솔로'),
    ('사이버 도살자', '솔로'),
    ('스마트 웨폰 러너', '넷러너'),
    ('건카타펑크', '솔로'),
    ('순수 넷러너', '넷러너'),
    ('산데비스탄 블레이드', '잠입/암살'),
    ('고릴라 암 솔로', '솔로'),
    ('은신 권총', '잠입/암살'),
    ('버서크 탱커', '솔로');


-- 빌드 사이버웨어 테이블 샘플 데이터
INSERT INTO build_cyberware
    (build_id, cyberware_id)
VALUES
    -- 스텔스 러너
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '아라사카 섀도')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키로시 "신탁" 안구')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '엑스-디스크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '옵티컬 카모')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '타이로신 주사기')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스텔스 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '강화 힘줄')
    ),
    -- 트리플 리볼버
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '밀리테크 팔콘 산데비스탄')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키로시 "스토커" 안구')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '충격 흡수기')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '움직이지 않는 힘')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키네틱 프레임')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '트리플 리볼버'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '강화 발목')
    ),
    -- 사이버 도살자
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '밀리테크 팔콘 산데비스탄')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '고릴라 팔')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '아드레날린 부스터')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '고밀도 골수')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '두번째 심장')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '사이버 도살자'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '맥스택 맨티스 블레이드')
    ),
    -- 스마트 웨폰 러너
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '테트라토닉 리플러 MK.5')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키로시 "코카트리스" 안구')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '스마트 링크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '메카트로닉 코어')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '바이오 모니터')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '스마트 웨폰 러너'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '혈액 펌프')
    ),
    -- 건카타펑크
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '밀리테크 팔콘 산데비스탄')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키로시 "스토커" 안구')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '움직이지 않는 힘')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '스마트 링크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '케렌지코프 부스트 시스템')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '건카타펑크'),
        (SELECT cyberware_id FROM cyberware WHERE cyberware_name = '키네틱 프레임')
    ),
    -- 순수 넷러너
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
             WHERE cyberware_name = '테트라토닉 리플러 MK.5')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '카밀로 램 매니저')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
             WHERE cyberware_name = '램 업그레이드')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '메모리 부스트')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
             WHERE cyberware_name = '바이오 모니터')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '순수 넷러너'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '스마트 링크')
    ),
    -- 산데비스탄 블레이드
    (
        (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '밀리테크 팔콘 산데비스탄')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '케렌지코프 부스트 시스템')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '맥스택 맨티스 블레이드')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
        (SELECT cyberware_id FROM cyberware
             WHERE cyberware_name = '네오섬유')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
        (SELECT cyberware_id FROM cyberware
             WHERE cyberware_name = '옵티컬 카모')
    ),
    (
          (SELECT build_id FROM build WHERE build_name = '산데비스탄 블레이드'),
          (SELECT cyberware_id FROM cyberware
           WHERE cyberware_name = '강화 힘줄')
      ),
    -- 고릴라 암 솔로
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '무어 테크 버서크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '고릴라 팔')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '충격 흡수기')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '아드레날린 부스터')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '고밀도 골수')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '고릴라 암 솔로'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '에피모픽 스켈레톤')
    ),
    -- 은신 권총
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '아라사카 섀도')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '키로시 "스토커" 안구')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '옵티컬 카모')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '스마트 링크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware 
            WHERE cyberware_name = '시냅틱 가속기')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '은신 권총'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '강화 발목')
    ),
    -- 버서크 탱커
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '무어 테크 버서크')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '고릴라 팔')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '에피모픽 스켈레톤')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '두번째 심장')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '혈액 펌프')
    ),
    (
        (SELECT build_id FROM build WHERE build_name = '버서크 탱커'),
        (SELECT cyberware_id FROM cyberware
            WHERE cyberware_name = '디펜지코프')
    );
