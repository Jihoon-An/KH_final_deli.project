package kh.deli.global.entity;

public enum UserType {
    OWNER("business"),
    MEMBER("client"),
    ADMIN("admin");

    private String type;

    UserType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
