
/* 长度不定的二维数组，列求和 */

public class SumColumn {

	public static void main(String[] args) {

		int[][] Arr = { { 1, 2, 3, 4 }, { 5, 6 }, { 7, 7, 8, 6, 7 } };

		int maxColumn = 0;
		for (int i = 0; i < Arr.length; i++) {
			if (maxColumn < Arr[i].length) {
				maxColumn = Arr[i].length;
			}
		}
		// System.out.println(maxColumn);

		int sum = 0;
		for (int j = 0; j < maxColumn; j++) {
			for (int i = 0; i < Arr.length; i++) {
				try {
					// System.out.println(Arr[i][j]);
					sum += Arr[i][j];
					if (i == Arr.length - 1) {
						System.out.println(sum);
						sum = 0;
					}

				} catch (ArrayIndexOutOfBoundsException e) {
					// System.out.println("error");
				}
			}
		}

	}

}
