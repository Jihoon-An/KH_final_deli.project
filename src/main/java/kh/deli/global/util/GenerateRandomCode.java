package kh.deli.global.util;

import org.springframework.stereotype.Repository;

import java.util.Random;

@Repository
public class GenerateRandomCode {

    private int codeLength = 12;
    private final char[] codeTable =  { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
            'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
            'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
            '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

    private final char[] specialTable = { '!', '@', '#', '$', '%', '^', '&', '*' };

    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        int tableLength = codeTable.length;
        int specialLength = specialTable.length;
        StringBuffer buf = new StringBuffer();

        for(int i = 0; i <= codeLength; i++) {
            buf.append(codeTable[random.nextInt(tableLength)]);
        }
        buf.append(specialTable[random.nextInt(specialLength)]);

        return buf.toString();
    }

    public int getCodeLength() {
        return codeLength;
    }

    public void setCodeLength(int codeLength) {
        this.codeLength = codeLength;
    }

}
