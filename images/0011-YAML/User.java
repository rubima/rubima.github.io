/*
 * DTO class for Java
 *   generated at Sun Oct 02 02:49:29 JST 2005
 */
package my;

/**
 * �桼���ޥ������ơ��֥�
 */
public class User implements java.io.Serializable {

    private  int          id;           /* �桼��ID */
    private  String       name;         /* ̾�� */
    private  String       desc;         /* Ŧ�� */
    private  String       email;        /* �᡼�륢�ɥ쥹 */
    private  int          group_id;     /* ��°���륰�롼�פ�ID */
    private  int          age;          /* ǯ�� */
    private  char         gender;       /* ���� */
    private  java.util.Date created_on;   /* �������� */
    private  java.util.Date updated_on;   /* �������� */
    private  Group        group;        /* ���롼�ץޥ������ơ��֥� */

    public int getId() { return id }
    public void setId(int id) { this.id = id; }
    public String getName() { return name }
    public void setName(String name) { this.name = name; }
    public String getDesc() { return desc }
    public void setDesc(String desc) { this.desc = desc; }
    public String getEmail() { return email }
    public void setEmail(String email) { this.email = email; }
    public int getGroupId() { return group_id }
    public void setGroupId(int group_id) { this.group_id = group_id; }
    public int getAge() { return age }
    public void setAge(int age) { this.age = age; }
    public char getGender() { return gender }
    public void setGender(char gender) { this.gender = gender; }
    public java.util.Date getCreatedOn() { return created_on }
    public void setCreatedOn(java.util.Date created_on) { this.created_on = created_on; }
    public java.util.Date getUpdatedOn() { return updated_on }
    public void setUpdatedOn(java.util.Date updated_on) { this.updated_on = updated_on; }
    public Group getGroup() { return group }
    public void setGroup(Group group) { this.group = group; }

}
