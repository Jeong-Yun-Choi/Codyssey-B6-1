-- 목적: 사이버웨어와 빌드의 조합을 관리하여 플레이 스타일별 빌드를 구성하고 비교·분석하기 위한 관계형 데이터베이스
-- 테이블 생성 순서 : 부모 테이블 cyberware_slot -> cyberware -> build -> build_cyberware

SHOW DATABASES;

-- 사이버웨어 장착 부위 테이블
CREATE TABLE cyberware_slot (
    -- 기본키 : 정수형 타입, 자동 생성 옵션 선택
    slot_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    -- 대체키 : 슬롯 이름, 가변적인 문자열 타입, 중복 불가, 빈 값 불가
    slot_name VARCHAR(50) NOT NULL UNIQUE,
    -- 최대 장착 개수 : 정수형 타입, 빈 값 불가
    max_equip_count INTEGER NOT NULL,
    -- 제약조건 : 제약조건 이름 지정
    CONSTRAINT chk_cyberware_slot_max_equip_count
    -- 실제 적용시킬 조건
        CHECK (max_equip_count >= 1)
);

-- 사이버웨어 테이블
CREATE TABLE cyberware (
    -- 기본키 : 정수형 타입, 자동 생성 옵션 선택
    cyberware_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    -- 사이버웨어 이름 : 가변적인 문자열 타입, 빈 값 불가
    cyberware_name VARCHAR(50) NOT NULL,
    -- 사이버웨어 등급: 1부터 5까지의 정수형 값, 빈 값 불가
    quality INTEGER NOT NULL,
    -- 사이버웨어 용량: 빌드의 전체 용량에서 해당 사이버웨어가 차지하는 수치, 빈 값 불가, 0도 허용
    capacity INTEGER NOT NULL DEFAULT 0,
    -- 방어력 증가량: 증가 효과가 없으면 0으로 저장
    defense_bonus INTEGER NOT NULL DEFAULT 0,
    -- 소속 슬롯 ID: cyberware_slot 테이블을 참조하는 외래키
    slot_id INTEGER NOT NULL,
    -- 제약조건 : 등급은 1부터 5까지만 허용
    CONSTRAINT chk_cyberware_quality
        CHECK (quality BETWEEN 1 AND 5),
    -- 제약조건 : 사이버웨어 이름은 같은 이름과 티어 시 중복 불가, 복합 유니크 제약조건으로 처리
    CONSTRAINT uq_cyberware_name_quality
        UNIQUE (cyberware_name, quality),
    -- 제약조건 : 사이버웨어 용량은 음수가 될 수 없음
    CONSTRAINT chk_cyberware_capacity
        CHECK (capacity >= 0),
    -- 제약조건 : 방어력 증가량은 음수가 될 수 없음
    CONSTRAINT chk_cyberware_defense_bonus
        CHECK (defense_bonus >= 0),
    -- 외래키 제약조건 : 존재하는 사이버웨어 슬롯만 참조 가능
    CONSTRAINT fk_cyberware_slot
        FOREIGN KEY (slot_id)
        REFERENCES cyberware_slot(slot_id)
);

-- 빌드 테이블
CREATE TABLE build (
    -- 기본키 : 정수형 타입, 자동 생성 옵션 선택
    build_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    -- 빌드 이름 : 가변적인 문자열 타입, 빈 값과 중복 불가
    build_name VARCHAR(50) NOT NULL UNIQUE,
    -- 빌드 유형 : 넷러너, 솔로, 잠입/암살
    -- 같은 유형의 빌드가 여러 개 있을 수 있으므로 UNIQUE는 적용하지 않음
    build_type VARCHAR(30) NOT NULL
    -- 빌드에서 사용할 수 있는 최대 사이버웨어 용량
    -- 게임 기준 최대 용량인 450으로 설정
    max_cyberware_capacity INTEGER NOT NULL DEFAULT 450,
    -- 제약조건 : 최대 사이버웨어 용량은 음수가 될 수 없음
    CONSTRAINT chk_build_max_cyberware_capacity
        CHECK (max_cyberware_capacity >= 0)
);

-- 빌드 사이버웨어 테이블
CREATE TABLE build_cyberware (
    -- 빌드 ID : build 테이블을 참조하는 외래키
    build_id INTEGER NOT NULL,
    -- 사이버웨어 ID : cyberware 테이블을 참조하는 외래키
    cyberware_id INTEGER NOT NULL,
    -- 같은 빌드에 같은 사이버웨어를 중복 연결하지 못하도록 설정
    CONSTRAINT pk_build_cyberware
    -- 복합 기본키
        PRIMARY KEY (build_id, cyberware_id),
    -- 존재하는 빌드만 참조 가능
    CONSTRAINT fk_build_cyberware_build
        FOREIGN KEY (build_id)
        REFERENCES build(build_id),
    -- 존재하는 사이버웨어만 참조 가능
    CONSTRAINT fk_build_cyberware
        FOREIGN KEY (cyberware_id)
        REFERENCES cyberware(cyberware_id)
);
