package com.zyfz.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserWithdrawExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public UserWithdrawExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNull() {
            addCriterion("money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(Double value) {
            addCriterion("money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(Double value) {
            addCriterion("money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(Double value) {
            addCriterion("money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(Double value) {
            addCriterion("money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(Double value) {
            addCriterion("money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<Double> values) {
            addCriterion("money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<Double> values) {
            addCriterion("money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(Double value1, Double value2) {
            addCriterion("money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(Double value1, Double value2) {
            addCriterion("money not between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andHhUserIdIsNull() {
            addCriterion("hh_user_id is null");
            return (Criteria) this;
        }

        public Criteria andHhUserIdIsNotNull() {
            addCriterion("hh_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andHhUserIdEqualTo(Integer value) {
            addCriterion("hh_user_id =", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdNotEqualTo(Integer value) {
            addCriterion("hh_user_id <>", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdGreaterThan(Integer value) {
            addCriterion("hh_user_id >", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("hh_user_id >=", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdLessThan(Integer value) {
            addCriterion("hh_user_id <", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("hh_user_id <=", value, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdIn(List<Integer> values) {
            addCriterion("hh_user_id in", values, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdNotIn(List<Integer> values) {
            addCriterion("hh_user_id not in", values, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdBetween(Integer value1, Integer value2) {
            addCriterion("hh_user_id between", value1, value2, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andHhUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("hh_user_id not between", value1, value2, "hhUserId");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountIsNull() {
            addCriterion("withdraw_account is null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountIsNotNull() {
            addCriterion("withdraw_account is not null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountEqualTo(String value) {
            addCriterion("withdraw_account =", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNotEqualTo(String value) {
            addCriterion("withdraw_account <>", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountGreaterThan(String value) {
            addCriterion("withdraw_account >", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountGreaterThanOrEqualTo(String value) {
            addCriterion("withdraw_account >=", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountLessThan(String value) {
            addCriterion("withdraw_account <", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountLessThanOrEqualTo(String value) {
            addCriterion("withdraw_account <=", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountLike(String value) {
            addCriterion("withdraw_account like", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNotLike(String value) {
            addCriterion("withdraw_account not like", value, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountIn(List<String> values) {
            addCriterion("withdraw_account in", values, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNotIn(List<String> values) {
            addCriterion("withdraw_account not in", values, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountBetween(String value1, String value2) {
            addCriterion("withdraw_account between", value1, value2, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNotBetween(String value1, String value2) {
            addCriterion("withdraw_account not between", value1, value2, "withdrawAccount");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeIsNull() {
            addCriterion("withdraw_account_type is null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeIsNotNull() {
            addCriterion("withdraw_account_type is not null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeEqualTo(String value) {
            addCriterion("withdraw_account_type =", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeNotEqualTo(String value) {
            addCriterion("withdraw_account_type <>", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeGreaterThan(String value) {
            addCriterion("withdraw_account_type >", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeGreaterThanOrEqualTo(String value) {
            addCriterion("withdraw_account_type >=", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeLessThan(String value) {
            addCriterion("withdraw_account_type <", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeLessThanOrEqualTo(String value) {
            addCriterion("withdraw_account_type <=", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeLike(String value) {
            addCriterion("withdraw_account_type like", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeNotLike(String value) {
            addCriterion("withdraw_account_type not like", value, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeIn(List<String> values) {
            addCriterion("withdraw_account_type in", values, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeNotIn(List<String> values) {
            addCriterion("withdraw_account_type not in", values, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeBetween(String value1, String value2) {
            addCriterion("withdraw_account_type between", value1, value2, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountTypeNotBetween(String value1, String value2) {
            addCriterion("withdraw_account_type not between", value1, value2, "withdrawAccountType");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameIsNull() {
            addCriterion("withdraw_account_name is null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameIsNotNull() {
            addCriterion("withdraw_account_name is not null");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameEqualTo(String value) {
            addCriterion("withdraw_account_name =", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameNotEqualTo(String value) {
            addCriterion("withdraw_account_name <>", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameGreaterThan(String value) {
            addCriterion("withdraw_account_name >", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameGreaterThanOrEqualTo(String value) {
            addCriterion("withdraw_account_name >=", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameLessThan(String value) {
            addCriterion("withdraw_account_name <", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameLessThanOrEqualTo(String value) {
            addCriterion("withdraw_account_name <=", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameLike(String value) {
            addCriterion("withdraw_account_name like", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameNotLike(String value) {
            addCriterion("withdraw_account_name not like", value, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameIn(List<String> values) {
            addCriterion("withdraw_account_name in", values, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameNotIn(List<String> values) {
            addCriterion("withdraw_account_name not in", values, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameBetween(String value1, String value2) {
            addCriterion("withdraw_account_name between", value1, value2, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andWithdrawAccountNameNotBetween(String value1, String value2) {
            addCriterion("withdraw_account_name not between", value1, value2, "withdrawAccountName");
            return (Criteria) this;
        }

        public Criteria andIsHandeIsNull() {
            addCriterion("is_hande is null");
            return (Criteria) this;
        }

        public Criteria andIsHandeIsNotNull() {
            addCriterion("is_hande is not null");
            return (Criteria) this;
        }

        public Criteria andIsHandeEqualTo(Byte value) {
            addCriterion("is_hande =", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeNotEqualTo(Byte value) {
            addCriterion("is_hande <>", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeGreaterThan(Byte value) {
            addCriterion("is_hande >", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeGreaterThanOrEqualTo(Byte value) {
            addCriterion("is_hande >=", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeLessThan(Byte value) {
            addCriterion("is_hande <", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeLessThanOrEqualTo(Byte value) {
            addCriterion("is_hande <=", value, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeIn(List<Byte> values) {
            addCriterion("is_hande in", values, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeNotIn(List<Byte> values) {
            addCriterion("is_hande not in", values, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeBetween(Byte value1, Byte value2) {
            addCriterion("is_hande between", value1, value2, "isHande");
            return (Criteria) this;
        }

        public Criteria andIsHandeNotBetween(Byte value1, Byte value2) {
            addCriterion("is_hande not between", value1, value2, "isHande");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}