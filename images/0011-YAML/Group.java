/*
 * DTO class for Java
 *   generated at Sun Oct 02 02:49:29 JST 2005
 */
package my;

/**
 * ���롼�ץޥ������ơ��֥�
 */
public class Group implements java.io.Serializable {

    private  int          id;           /* ���롼��ID */
    private  String       name;         /* ̾�� */
    private  String       desc;         /* Ŧ�� */
    private  java.util.Date created_on;   /* �������� */
    private  java.util.Date updated_on;   /* �������� */

    public int getId() { return id }
    public void setId(int id) { this.id = id; }
    public String getName() { return name }
    public void setName(String name) { this.name = name; }
    public String getDesc() { return desc }
    public void setDesc(String desc) { this.desc = desc; }
    public java.util.Date getCreatedOn() { return created_on }
    public void setCreatedOn(java.util.Date created_on) { this.created_on = created_on; }
    public java.util.Date getUpdatedOn() { return updated_on }
    public void setUpdatedOn(java.util.Date updated_on) { this.updated_on = updated_on; }

}
