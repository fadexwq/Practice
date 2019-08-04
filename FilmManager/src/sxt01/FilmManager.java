package sxt01;

import java.util.Scanner;

public class FilmManager {
	private Film[] films; // �洢��Ӱ������
	private int count; // ��¼��Ӱ����

	{
		this.films = new Film[100];
		this.count = 0;
	}

	public FilmManager() {
		this.films[0] = new Film("�Ҳ���ҩ��", "����Ұ", "���", 120);
		this.films[1] = new Film("�������׸�", "����", "����", 130);
		this.films[2] = new Film("���鹫Ԣ", "�º�", "�º�", 140);

		this.count = 3;
	}

	public void start() {
		System.out.println("��ӭsxt����Ӱ��");
		System.out.println("------------------------------");
		System.out.println("1.��ӵ�Ӱ");
		System.out.println("2.�鿴��Ӱ");
		System.out.println("3.ɾ����Ӱ");
		System.out.println("4.�˳�");
		System.out.println("------------------------------");
		System.out.println("��ѡ��:");

		Scanner sc = new Scanner(System.in);
		int choice = sc.nextInt();

		switch (choice) {
			case 1: {
				this.add();
				break;
			}
			case 2: {
				this.check();
				break;
			}
			case 3: {
				this.delete();
				break;
			}
			case 4: {
				System.out.println("�����˳�");
				break;
			}
			default: {
				break;
			}
		}

	}

	private void add() {
		System.out.println("-->��ӵ�Ӱ:");
		Scanner sc = new Scanner(System.in);
		
		System.out.println("�������Ӱ����:");
		String name = sc.nextLine();
		
		System.out.println("�����뵼��:");
		String director = sc.nextLine();
		
		System.out.println("����������:");
		String actors = sc.nextLine();
		
		System.out.println("������ʱ��:");
		int time = sc.nextInt();
		
		Film f = new Film(name, director, actors, time);
		this.films[this.count++] = f;
		System.out.println("��"+name+"����ӳɹ�!");
		
		this.back();
	}

	private void delete() {
		// 1.�����Ӱ����
		System.out.println("������Ҫɾ���ĵ�Ӱ����:");
		Scanner sc = new Scanner(System.in);
		String name = sc .nextLine();
		
		// 2.���ҵ�Ӱ
		int loc = -1;
		for(int i=0;i<this.count;i++) {
			if(name.equals(this.films[i].getName())) {
				loc = i;
				break;
			}
		}
		
		if(loc < 0) {
			System.out.println("�Բ���û��Ҫɾ���ĵ�Ӱ!");
		}else {
			// 3.ɾ����Ӱ
			for(int j=loc+1;j<this.count;j++) {
				this.films[j-1] = this.films[j];
			}
			
			this.count--;
			// 4.�����һ��Ԫ���ÿ�
			this.films[this.count] = null;
			System.out.println("��"+name+"��ɾ���ɹ�!");
		}
		
		this.back();
		
	}

	private void check() {
		System.out.println("-->�鿴��Ѷ:");
		System.out.println("���\t��Ӱ����\t\t����\t����\tʱ��");
		for (int i = 0; i < this.count; i++) {
			this.films[i].showInfo(i + 1);
		}
		
		back();
	}

	private void back() {
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("��0����:");
			int n = sc.nextInt();
			if (n == 0) {
				break;
			} else {
				System.out.println("�������");
			}
		} while (true);

		this.start();
	}

}
