CREATE TABLE test
(
    `pk` int,
    `a` int,
    `b` int,
    `c` int
)
ENGINE = MergeTree
PRIMARY KEY tuple(pk);

INSERT INTO test values(1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5);

SET allow_experimental_analyzer = 1;

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (a < b) AND (b < c) AND (c < 5);

-- test where condition is constant false
SELECT pk
FROM test
WHERE (a = 3) AND (a = 5);

-- test where condition is not in
SELECT pk
FROM test
WHERE (a != 1) AND (a != 2) AND (a != 4);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (b > a) AND (c > b) AND (5 > c);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (c > 0) AND (c < 5);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (a <= b) AND (b <= c) AND (c <= 5);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (a < b) AND (b < c) AND (c <= 5);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (a < b) AND (b <= c) AND (c < 5);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (b >= a) AND (c >= b) AND (5 >= c);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (b > a) AND (c > b) AND (5 >= c);

EXPLAIN QUERY TREE
SELECT pk
FROM test
WHERE (b > a) AND (c >= b) AND (5 > c);