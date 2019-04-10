package test;

public class Test2 extends Thread {

	public void run() {
		for (int i = 1; i <= 100; i++) {
			System.out.print(i);
			if(i%5==0) {
				System.out.println();
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

	}

	public static void main(String[] args) {
		Thread t = new Test2();
		t.start();
	}
}
