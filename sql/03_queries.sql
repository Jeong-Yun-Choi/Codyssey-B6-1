## 1. 기본 조회 쿼리

SHOW DATABASES;
USE cyberware_build_db;

### 문제 1
Q1. 등급이 4 이상인 사이버웨어의 이름, 등급, 용량을 조회하십시오.

SELECT cyberware_name, quality, capacity
FROM cyberware
WHERE quality >= 4;

### 문제 2
Q2. 사이버웨어 용량이 10 이하인 사이버웨어를 용량이 작은 순서로 조회하십시오.

SELECT cyberware_name, capacity
FROM cyberware
WHERE capacity <= 10
ORDER BY capacity ASC;

### 문제 3
Q3. 빌드 유형이 넷러너인 빌드의 이름과 최대 사이버웨어 용량을 조회하십시오.

SELECT build_name, max_cyberware_capacity
FROM build
WHERE build_type = '넷러너';

### 문제 4
Q4. 사이버웨어 이름에 안구라는 단어가 포함된 사이버웨어를 조회하십시오.

SELECT cyberware_name
FROM cyberware
WHERE cyberware_name LIKE "%안구%";


## 2. JOIN 쿼리

USE cyberware_build_db;

### 문제 5
Q5. 각 사이버웨어의 이름과 해당 사이버웨어가 장착되는 슬롯 이름을 조회하십시오.

SELECT c.cyberware_name, s.slot_name
FROM cyberware as c
JOIN cyberware_slot as s
    ON c.slot_id = s.slot_id;

### 문제 6
Q6. 각 빌드에 포함된 사이버웨어 이름을 빌드 이름과 함께 조회하십시오.

SELECT c.cyberware_name, b.build_name
FROM build as b
JOIN build_cyberware as bc
    ON b.build_id = bc.build_id
JOIN cyberware as c
    ON c.cyberware_id = bc.cyberware_id;

### 문제 7
Q7. 잠입/암살 유형의 빌드에 포함된 사이버웨어의 이름, 슬롯 이름, 용량을 조회하십시오.

  -- TODO

  ### 문제 8

  각 빌드에서 사용하는 운영체제 사이버웨어를 빌드 이름과 함께 조회하십시오.

  -- TODO

  ## 3. 집계 및 GROUP BY 쿼리

  ### 문제 9

  각 사이버웨어 슬롯에 등록된 사이버웨어의 개수를 구하십시오.

  -- TODO

  ### 문제 10

  사이버웨어 등급별 평균 용량을 구하십시오.

  -- TODO

  ### 문제 11

  각 빌드에 연결된 사이버웨어의 개수를 구하십시오.

  -- TODO

## 4. 서브쿼리

### 문제 12

전체 사이버웨어의 평균 용량보다 용량이 큰 사이버웨어를 조회하십시오.

-- TODO

## 5. UPDATE·DELETE 쿼리

### 문제 13

옵터컬 카모의 방어력 증가량을 현재 값에서 30으로 수정하십시오.

-- TODO

### 문제 14

현재 어떤 빌드에도 연결되지 않은 투사체 발사 시스템 사이버웨어를 삭제하십시오.
삭제하기 전에 해당 사이버웨어가 build_cyberware에 연결되어 있지 않은지 먼저 확인하십시오.

-- TODO

## 6. INDEX 쿼리

### 문제 15

사이버웨어의 quality와 capacity를 조건으로 검색하는 조회가 효율적으로 수행되도록 인덱스를 생성하십시오.
인덱스 이름과 인덱스를 적용할 컬럼을 직접 결정하십시오.

-- TODO
