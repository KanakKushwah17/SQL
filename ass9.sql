Haan bhai 😎 **with output** hi karte hain.
Main **original given data ko starting point** maan raha hoon, yani **har question independently run** kiya gaya hai. Agar Q1 ke baad Q2, Q3... sequentially run karoge, output change hota rahega.

## Starting Data

| ID | Name   | Dept    | City   | Salary | Exp | Status   |
| -: | ------ | ------- | ------ | -----: | --: | -------- |
|  1 | Aarav  | IT      | Indore |  48000 |   3 | Active   |
|  2 | Bhavna | HR      | Bhopal |  56000 |   5 | Active   |
|  3 | Chetan | Finance | Delhi  |  62000 |   7 | Active   |
|  4 | Divya  | IT      | Pune   |  78000 |   9 | Active   |
|  5 | Eshan  | Sales   | Indore |  51000 |   4 | Inactive |
|  6 | Farah  | HR      | NULL   |  68000 |   6 | Active   |

---

# Q1. Aarav salary → ₹52,000

```sql
UPDATE staff_update
SET salary = 52000
WHERE staff_id = 1;

SELECT * FROM staff_update
WHERE staff_id = 1;
```

### Output

| staff_id | staff_name | department |   salary | experience | status |
| -------: | ---------- | ---------- | -------: | ---------: | ------ |
|        1 | Aarav      | IT         | 52000.00 |          3 | Active |

**Note:** `staff_id` primary key se Aarav identify hua.

---

# Q2. Bhavna → Finance, Indore

```sql
UPDATE staff_update
SET department = 'Finance',
    city = 'Indore'
WHERE staff_id = 2;

SELECT * FROM staff_update
WHERE staff_id = 2;
```

### Output

| staff_id | staff_name | department | city   |   salary | status |
| -------: | ---------- | ---------- | ------ | -------: | ------ |
|        2 | Bhavna     | Finance    | Indore | 56000.00 | Active |

---

# Q3. ₹4,000 increment

```sql
UPDATE staff_update
SET salary = salary + 4000
WHERE salary < 60000
  AND experience >= 3
  AND department <> 'Sales';

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Aarav, Bhavna**

### Output

| ID | Name   | Dept    |   Salary |
| -: | ------ | ------- | -------: |
|  1 | Aarav  | IT      | 52000.00 |
|  2 | Bhavna | HR      | 60000.00 |
|  3 | Chetan | Finance | 62000.00 |
|  4 | Divya  | IT      | 78000.00 |
|  5 | Eshan  | Sales   | 51000.00 |
|  6 | Farah  | HR      | 68000.00 |

> ⚠️ Agar Q1 pehle execute nahi hua ho, Aarav ka salary output **52000** hi hoga after Q3 as well.

---

# Q4. IT/HR conditions → ₹3,000

```sql
UPDATE staff_update
SET salary = salary + 3000
WHERE (department = 'IT' AND experience >= 3)
   OR (department = 'HR' AND experience >= 5);

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Aarav, Bhavna, Divya, Farah**

### Output

| ID | Name   | Dept    | New Salary |
| -: | ------ | ------- | ---------: |
|  1 | Aarav  | IT      |   51000.00 |
|  2 | Bhavna | HR      |   59000.00 |
|  3 | Chetan | Finance |   62000.00 |
|  4 | Divya  | IT      |   81000.00 |
|  5 | Eshan  | Sales   |   51000.00 |
|  6 | Farah  | HR      |   71000.00 |

---

# Q5. IT/Finance + salary < 70k → 10%

```sql
UPDATE staff_update
SET salary = salary * 1.10
WHERE department IN ('IT', 'Finance')
  AND salary < 70000;

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Aarav, Chetan**

### Output

| ID | Name   | Dept    |   Salary |
| -: | ------ | ------- | -------: |
|  1 | Aarav  | IT      | 52800.00 |
|  2 | Bhavna | HR      | 56000.00 |
|  3 | Chetan | Finance | 68200.00 |
|  4 | Divya  | IT      | 78000.00 |
|  5 | Eshan  | Sales   | 51000.00 |
|  6 | Farah  | HR      | 68000.00 |

---

# Q6. Neither HR nor Sales + experience 5–8 → ₹2,500

```sql
UPDATE staff_update
SET salary = salary + 2500
WHERE department NOT IN ('HR', 'Sales')
  AND experience BETWEEN 5 AND 8;

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Chetan only**

### Output

| ID | Name   | Dept    |   Salary |
| -: | ------ | ------- | -------: |
|  1 | Aarav  | IT      | 48000.00 |
|  2 | Bhavna | HR      | 56000.00 |
|  3 | Chetan | Finance | 64500.00 |
|  4 | Divya  | IT      | 78000.00 |
|  5 | Eshan  | Sales   | 51000.00 |
|  6 | Farah  | HR      | 68000.00 |

---

# Q7. Salary 50k–70k, Finance excluded → ₹5,000

```sql
UPDATE staff_update
SET salary = salary + 5000
WHERE salary BETWEEN 50000 AND 70000
  AND department <> 'Finance';

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Bhavna, Eshan, Farah**

### Output

| ID | Name   | Dept    | New Salary |
| -: | ------ | ------- | ---------: |
|  1 | Aarav  | IT      |   48000.00 |
|  2 | Bhavna | HR      |   61000.00 |
|  3 | Chetan | Finance |   62000.00 |
|  4 | Divya  | IT      |   78000.00 |
|  5 | Eshan  | Sales   |   56000.00 |
|  6 | Farah  | HR      |   73000.00 |

---

# Q8. Names starting A or D → 7%

```sql
UPDATE staff_update
SET salary = salary * 1.07
WHERE staff_name LIKE 'A%'
   OR staff_name LIKE 'D%';

SELECT staff_id, staff_name, salary
FROM staff_update;
```

Eligible: **Aarav, Divya**

### Output

| ID | Name   |   Salary |
| -: | ------ | -------: |
|  1 | Aarav  | 51360.00 |
|  2 | Bhavna | 56000.00 |
|  3 | Chetan | 62000.00 |
|  4 | Divya  | 83460.00 |
|  5 | Eshan  | 51000.00 |
|  6 | Farah  | 68000.00 |

---

# Q9. Farah NULL city → Mumbai

```sql
UPDATE staff_update
SET city = 'Mumbai'
WHERE staff_name = 'Farah'
  AND city IS NULL;

SELECT staff_id, staff_name, city
FROM staff_update
WHERE staff_name = 'Farah';
```

### Output

| ID | Name  | City   |
| -: | ----- | ------ |
|  6 | Farah | Mumbai |

### ⭐ Remember

```sql
IS NULL
```

not:

```sql
= NULL
```

---

# Q10. Before 2020 + salary < 70k → 10%

```sql
UPDATE staff_update
SET salary = salary * 1.10
WHERE joining_date < '2020-01-01'
  AND salary < 70000;

SELECT staff_id, staff_name, salary
FROM staff_update;
```

Eligible: **Chetan, Farah**

### Output

| ID | Name   |   Salary |
| -: | ------ | -------: |
|  1 | Aarav  | 48000.00 |
|  2 | Bhavna | 56000.00 |
|  3 | Chetan | 68200.00 |
|  4 | Divya  | 78000.00 |
|  5 | Eshan  | 51000.00 |
|  6 | Farah  | 74800.00 |

---

# Q11. IT + experience >= 5

```sql
UPDATE staff_update
SET salary = salary * 1.08,
    experience = experience + 1,
    status = 'Promoted'
WHERE department = 'IT'
  AND experience >= 5;

SELECT staff_id, staff_name, salary, experience, status
FROM staff_update;
```

Eligible: **Divya**

### Output

| ID | Name   |   Salary | Exp | Status   |
| -: | ------ | -------: | --: | -------- |
|  1 | Aarav  | 48000.00 |   3 | Active   |
|  2 | Bhavna | 56000.00 |   5 | Active   |
|  3 | Chetan | 62000.00 |   7 | Active   |
|  4 | Divya  | 84240.00 |  10 | Promoted |
|  5 | Eshan  | 51000.00 |   4 | Inactive |
|  6 | Farah  | 68000.00 |   6 | Active   |

---

# Q12. HR/Finance + exp >=5 + salary <75k → ₹6k

```sql
UPDATE staff_update
SET salary = salary + 6000
WHERE experience >= 5
  AND salary < 75000
  AND department IN ('HR', 'Finance');

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

Eligible: **Bhavna, Chetan, Farah**

### Output

| ID | Name   | Dept    |   Salary |
| -: | ------ | ------- | -------: |
|  1 | Aarav  | IT      | 48000.00 |
|  2 | Bhavna | HR      | 62000.00 |
|  3 | Chetan | Finance | 68000.00 |
|  4 | Divya  | IT      | 78000.00 |
|  5 | Eshan  | Sales   | 51000.00 |
|  6 | Farah  | HR      | 74000.00 |

---

# 🔥 Q13. Department-wise percentage

```sql
UPDATE staff_update
SET salary = salary *
CASE
    WHEN department = 'IT' THEN 1.12
    WHEN department = 'HR' THEN 1.09
    WHEN department = 'Finance' THEN 1.08
    WHEN department = 'Sales' THEN 1.05
    ELSE 1
END;

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

### Output

| ID | Name   | Dept    | New Salary |
| -: | ------ | ------- | ---------: |
|  1 | Aarav  | IT      |   53760.00 |
|  2 | Bhavna | HR      |   61040.00 |
|  3 | Chetan | Finance |   66960.00 |
|  4 | Divya  | IT      |   87360.00 |
|  5 | Eshan  | Sales   |   53550.00 |
|  6 | Farah  | HR      |   74120.00 |

---

# 🔥 Q14. Experience-wise increment

```sql
UPDATE staff_update
SET salary = salary *
CASE
    WHEN experience >= 8 THEN 1.15
    WHEN experience BETWEEN 5 AND 7 THEN 1.10
    WHEN experience BETWEEN 3 AND 4 THEN 1.07
    ELSE 1.05
END;

SELECT staff_id, staff_name, experience, salary
FROM staff_update;
```

### Output

| ID | Name   | Exp |   Salary |
| -: | ------ | --: | -------: |
|  1 | Aarav  |   3 | 51360.00 |
|  2 | Bhavna |   5 | 61600.00 |
|  3 | Chetan |   7 | 68200.00 |
|  4 | Divya  |   9 | 89700.00 |
|  5 | Eshan  |   4 | 54570.00 |
|  6 | Farah  |   6 | 74800.00 |

---

# 🔥 Q15. Department + experience

```sql
UPDATE staff_update
SET salary = salary *
CASE
    WHEN department = 'IT' AND experience >= 8 THEN 1.18
    WHEN department = 'IT' THEN 1.10
    WHEN department = 'HR' AND experience >= 6 THEN 1.12
    WHEN department = 'HR' THEN 1.07
    WHEN department = 'Finance' THEN 1.08
    WHEN department = 'Sales' THEN 1.05
    ELSE 1
END;

SELECT staff_id, staff_name, department, salary
FROM staff_update;
```

### Output

| ID | Name   | Dept    |   Salary |
| -: | ------ | ------- | -------: |
|  1 | Aarav  | IT      | 52800.00 |
|  2 | Bhavna | HR      | 59920.00 |
|  3 | Chetan | Finance | 66960.00 |
|  4 | Divya  | IT      | 92040.00 |
|  5 | Eshan  | Sales   | 53550.00 |
|  6 | Farah  | HR      | 76160.00 |

---

# 🔥 Q16. Salary → Status

```sql
UPDATE staff_update
SET status =
CASE
    WHEN salary >= 75000 THEN 'Senior'
    WHEN salary >= 60000 THEN 'Experienced'
    WHEN salary >= 50000 THEN 'Regular'
    ELSE 'Junior'
END;

SELECT staff_id, staff_name, salary, status
FROM staff_update;
```

### Output

| ID | Name   | Salary | Status      |
| -: | ------ | -----: | ----------- |
|  1 | Aarav  |  48000 | Junior      |
|  2 | Bhavna |  56000 | Regular     |
|  3 | Chetan |  62000 | Experienced |
|  4 | Divya  |  78000 | Senior      |
|  5 | Eshan  |  51000 | Regular     |
|  6 | Farah  |  68000 | Experienced |

---

# 🔵 Q17. Custom department order

```sql
SELECT *
FROM staff_update
ORDER BY CASE
    WHEN department = 'Finance' THEN 1
    WHEN department = 'IT' THEN 2
    WHEN department = 'HR' THEN 3
    WHEN department = 'Sales' THEN 4
END;
```

### Output order

| Priority | Department | Employees     |
| -------: | ---------- | ------------- |
|        1 | Finance    | Chetan        |
|        2 | IT         | Aarav, Divya  |
|        3 | HR         | Bhavna, Farah |
|        4 | Sales      | Eshan         |

**Note:** Actual table mein department change **nahi** hua.

---

# 🔵 Q18. IT → HR → Finance → Sales + highest salary first

```sql
SELECT *
FROM staff_update
ORDER BY
CASE
    WHEN department = 'IT' THEN 1
    WHEN department = 'HR' THEN 2
    WHEN department = 'Finance' THEN 3
    WHEN department = 'Sales' THEN 4
END,
salary DESC;
```

### Output

| Order | Name   | Dept    | Salary |
| ----: | ------ | ------- | -----: |
|     1 | Divya  | IT      |  78000 |
|     2 | Aarav  | IT      |  48000 |
|     3 | Farah  | HR      |  68000 |
|     4 | Bhavna | HR      |  56000 |
|     5 | Chetan | Finance |  62000 |
|     6 | Eshan  | Sales   |  51000 |

---

# 🔵 Q19. Experience priority

```sql
SELECT *
FROM staff_update
ORDER BY CASE
    WHEN experience >= 8 THEN 1
    WHEN experience BETWEEN 5 AND 7 THEN 2
    WHEN experience BETWEEN 3 AND 4 THEN 3
    ELSE 4
END;
```

### Output order

| Priority | Name   | Experience |
| -------: | ------ | ---------: |
|        1 | Divya  |          9 |
|        2 | Chetan |          7 |
|        2 | Farah  |          6 |
|        2 | Bhavna |          5 |
|        3 | Eshan  |          4 |
|        3 | Aarav  |          3 |

---

# 🔴 Q20. Only ONE lowest-paid eligible

```sql
UPDATE staff_update
SET salary = salary + 5000
WHERE staff_id = (
    SELECT staff_id
    FROM (
        SELECT staff_id
        FROM staff_update
        WHERE department IN ('IT', 'HR')
          AND experience >= 3
          AND salary < 70000
        ORDER BY salary ASC
        LIMIT 1
    ) AS temp
);

SELECT staff_id, staff_name, salary
FROM staff_update;
```

Eligible:

```text
Aarav 48000
Bhavna 56000
Farah 68000
```

Lowest = **Aarav**

### Output

| ID | Name  |       Salary |
| -: | ----- | -----------: |
|  1 | Aarav | **53000.00** |

Only Aarav changes.

---

# 🔴 Q21. Only ONE highest-paid Active + exp >=5

Eligible:

```text
Bhavna → 56000
Chetan → 62000
Divya  → 78000
Farah  → 68000
```

Highest = **Divya**

```sql
UPDATE staff_update
SET salary = salary * 1.10
WHERE staff_id = (
    SELECT staff_id
    FROM (
        SELECT staff_id
        FROM staff_update
        WHERE status = 'Active'
          AND experience >= 5
        ORDER BY salary DESC
        LIMIT 1
    ) AS temp
);

SELECT staff_id, staff_name, salary
FROM staff_update
WHERE staff_id = 4;
```

### Output

| ID | Name  |       Salary |
| -: | ----- | -----------: |
|  4 | Divya | **85800.00** |

---

# 🔴 Q22. Lowest-paid eligible → ₹3k

Eligible:

```text
Aarav → 48000
Chetan → 62000
Divya → 78000
```

Lowest = Aarav.

```sql
UPDATE staff_update
SET salary = salary + 3000
WHERE staff_id = (
    SELECT staff_id
    FROM (
        SELECT staff_id
        FROM staff_update
        WHERE department NOT IN ('HR', 'Sales')
          AND experience >= 3
        ORDER BY salary ASC
        LIMIT 1
    ) AS temp
);
```

### Output

| ID | Name  |   New Salary |
| -: | ----- | -----------: |
|  1 | Aarav | **51000.00** |

---

# 🔴 Q23. Highest-paid IT → Promoted

```sql
UPDATE staff_update
SET status = 'Promoted'
WHERE staff_id = (
    SELECT staff_id
    FROM (
        SELECT staff_id
        FROM staff_update
        WHERE department = 'IT'
        ORDER BY salary DESC
        LIMIT 1
    ) AS temp
);

SELECT staff_id, staff_name, department, salary, status
FROM staff_update
WHERE department = 'IT';
```

### Output

| ID | Name  | Salary | Status       |
| -: | ----- | -----: | ------------ |
|  1 | Aarav |  48000 | Active       |
|  4 | Divya |  78000 | **Promoted** |

---

# 🔴 Q24. 12% increment

```sql
UPDATE staff_update
SET salary = salary * 1.12
WHERE status = 'Active'
  AND salary < 80000
  AND (
       (department = 'IT' AND experience >= 5)
       OR
       (department = 'Finance' AND salary < 65000)
  );
```

Eligible: **Chetan** only.

### Output

| ID | Name   | Old Salary |   New Salary |
| -: | ------ | ---------: | -----------: |
|  3 | Chetan |      62000 | **69440.00** |

---

# 🔥 Q25. CASE revision

```sql
UPDATE staff_update
SET salary = salary *
CASE
    WHEN department = 'IT' AND experience >= 8 THEN 1.18
    WHEN department = 'IT' THEN 1.10
    WHEN department = 'HR' AND experience >= 6 THEN 1.10
    WHEN department = 'HR' THEN 1.07
    WHEN department = 'Finance' AND salary < 65000 THEN 1.10
    WHEN department = 'Finance' THEN 1.07
    WHEN department = 'Sales' AND experience >= 4 THEN 1.06
    ELSE 1.03
END;
```

### Output

| Name   | Dept    | Exp |   Old |   New |
| ------ | ------- | --: | ----: | ----: |
| Aarav  | IT      |   3 | 48000 | 52800 |
| Bhavna | HR      |   5 | 56000 | 59920 |
| Chetan | Finance |   7 | 62000 | 68200 |
| Divya  | IT      |   9 | 78000 | 92040 |
| Eshan  | Sales   |   4 | 51000 | 54060 |
| Farah  | HR      |   6 | 68000 | 74800 |

---

# 🔥 Q26. Salary + Status

```sql
UPDATE staff_update
SET
salary = salary *
CASE
    WHEN experience >= 8 THEN 1.15
    WHEN experience BETWEEN 5 AND 7 THEN 1.10
    WHEN experience BETWEEN 3 AND 4 THEN 1.07
    ELSE 1.05
END,

status =
CASE
    WHEN experience >= 8 THEN 'Promoted'
    WHEN experience BETWEEN 5 AND 7 THEN 'Eligible'
    WHEN experience BETWEEN 3 AND 4 THEN 'Regular'
    ELSE 'Junior'
END;
```

### Output

| Name   | Exp | New Salary | Status   |
| ------ | --: | ---------: | -------- |
| Aarav  |   3 |      51360 | Regular  |
| Bhavna |   5 |      61600 | Eligible |
| Chetan |   7 |      68200 | Eligible |
| Divya  |   9 |      89700 | Promoted |
| Eshan  |   4 |      54570 | Regular  |
| Farah  |   6 |      74800 | Eligible |

---

# 🔴 Q27. Promoted

```sql
UPDATE staff_update
SET status = 'Promoted'
WHERE experience >= 6
  AND salary >= 60000
  AND status = 'Active'
  AND department IN ('IT', 'HR', 'Finance');

SELECT staff_id, staff_name, status
FROM staff_update;
```

### Eligible

| Name   | Dept    | Exp | Salary | New Status |
| ------ | ------- | --: | -----: | ---------- |
| Chetan | Finance |   7 |  62000 | Promoted   |
| Divya  | IT      |   9 |  78000 | Promoted   |
| Farah  | HR      |   6 |  68000 | Promoted   |

---

# 🔴 Q28. IT → Bangalore + 10% + Transferred

```sql
UPDATE staff_update
SET salary = salary * 1.10,
    city = 'Bangalore',
    status = 'Transferred'
WHERE department = 'IT'
  AND experience >= 5
  AND city IN ('Pune', 'Delhi');

SELECT staff_id, staff_name, salary, city, status
FROM staff_update;
```

Eligible: **Divya**

### Output

| ID | Name  |   Salary | City      | Status      |
| -: | ----- | -------: | --------- | ----------- |
|  4 | Divya | 85800.00 | Bangalore | Transferred |

---

# 🔴 Q29. ONE special ₹7,000 increment

Eligible:

```text
IT / HR / Finance
experience >= 4
Active
salary < 75000
```

Lowest-paid = **Bhavna ₹56,000**

```sql
UPDATE staff_update
SET salary = salary + 7000
WHERE staff_id = (
    SELECT staff_id
    FROM (
        SELECT staff_id
        FROM staff_update
        WHERE department IN ('IT', 'HR', 'Finance')
          AND experience >= 4
          AND status = 'Active'
          AND salary < 75000
        ORDER BY salary ASC
        LIMIT 1
    ) AS temp
);

SELECT staff_id, staff_name, salary
FROM staff_update;
```

### Output

| ID | Name   |   Old |          New |
| -: | ------ | ----: | -----------: |
|  2 | Bhavna | 56000 | **63000.00** |

---

# 👑 Q30. FINAL BOSS + Output

```sql
UPDATE staff_update
SET
salary =
salary *
CASE
    WHEN department = 'IT'
         AND experience >= 8
         AND salary >= 70000 THEN 1.18

    WHEN department = 'IT'
         AND experience >= 5 THEN 1.12

    WHEN department = 'HR'
         AND experience >= 6 THEN 1.10

    WHEN department = 'HR'
         AND experience < 6 THEN 1.07

    WHEN department = 'Finance'
         AND salary < 65000 THEN 1.10

    WHEN department = 'Finance'
         AND salary >= 65000 THEN 1.07

    WHEN department = 'Sales'
         AND experience >= 4 THEN 1.06

    ELSE 1.03
END,

status =
CASE
    WHEN department = 'IT'
         AND experience >= 8
         AND salary >= 70000 THEN 'Promoted'

    WHEN department = 'IT'
         AND experience >= 5 THEN 'Eligible'

    WHEN department = 'HR'
         AND experience >= 6 THEN 'Eligible'

    WHEN department = 'HR'
         AND experience < 6 THEN 'Under Review'

    WHEN department = 'Finance'
         AND salary < 65000 THEN 'Eligible'

    WHEN department = 'Finance'
         AND salary >= 65000 THEN 'Under Review'

    WHEN department = 'Sales'
         AND experience >= 4 THEN 'Under Review'

    ELSE 'Under Review'
END

WHERE status = 'Active';
```

### Output from original data

| ID | Name   | Dept    | Old Salary |   New Salary | Status       |
| -: | ------ | ------- | ---------: | -----------: | ------------ |
|  1 | Aarav  | IT      |      48000 |     49440.00 | Under Review |
|  2 | Bhavna | HR      |      56000 |     59920.00 | Under Review |
|  3 | Chetan | Finance |      62000 |     66340.00 | Under Review |
|  4 | Divya  | IT      |      78000 |     92040.00 | **Promoted** |
|  5 | Eshan  | Sales   |      51000 | **51000.00** | Inactive     |
|  6 | Farah  | HR      |      68000 |     74800.00 | **Eligible** |

### 🧠 Q30 ka logic

```text
Divya
IT + 9 years + 78000
       ↓
18%
       ↓
Promoted
```

```text
Farah
HR + 6 years + 68000
       ↓
10%
       ↓
Eligible
```

```text
Aarav
IT + 3 years
       ↓
Remaining
       ↓
3%
       ↓
Under Review
```

```text
Eshan
Inactive
       ↓
NO increment
       ↓
Salary unchanged
```

---

# 🚨 5 Patterns jo machine test mein pakka yaad rakhna

### 1️⃣ Simple update

```sql
UPDATE table
SET salary = salary + 5000
WHERE condition;
```

### 2️⃣ Multiple conditions

```sql
WHERE condition1
AND condition2
AND department IN ('IT','HR');
```

### 3️⃣ Percentage

```sql
SET salary = salary * 1.10;
```

### 4️⃣ Multiple possibilities

```sql
SET salary = salary *
CASE
    WHEN condition1 THEN 1.18
    WHEN condition2 THEN 1.10
    ELSE 1.03
END;
```

### 5️⃣ Only highest/lowest one

```sql
ORDER BY salary DESC
LIMIT 1
```

**Highest**

```sql
ORDER BY salary ASC
LIMIT 1
```

**Lowest**

