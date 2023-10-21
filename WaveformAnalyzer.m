classdef WaveformAnalyzer < handle
    %% Описание класса
    %
    % 1. Класс читает данные (во временной области) на выходе OFDM модулятора сигнала, а также информацию о параметрах формирователя
    %
    % 2. Строит метрики: спектральная плотность мощности в частотной области, графическое представление созвездия на комплексной плоскости,
    % среднеквадратичное значение модуля вектора ошибки (EVM)
    %
    % Входные данные:
    %
    % waveformSource - массив содержащий отчеты baseband сигнала во временной области на выходе OFDM модулятора
    %
    % waveformInfo - структура с параметрами OFDM модулятора и пейлоуда:
    %       Nfft               - кол-во спектрально-временных отчетов дискретного преобразования Фурье
    %       SampleRate         - частота семплирования [Гц]
    %       CyclicPrefixLengths/SymbolLengths - длины циклического преффикса и OFDM символов [кол-во временных отчетов]
    %       SymbolsCount       - кол-во символов на слот радиокадра
    %       subCarriersCount   - кол-во поднесущих
    %       payloadSymbols     - информационные символы
    %       payloadSymbolsIdxs - индексы ресурсных элементов отведенные для передачи payloadSymbols
    %
    % Поля класса:
    %
    %       rmsEvm            - среднеквадратичное значение модуля вектора ошибки
    %       waveformMeanPower - среднеквадратичное значение мощности сигнала
    %       channelBandwidth  - ширина полосы канала
    %       noiseMeanPower    - среднеквадратичное значение мощности шума
    %       modulationType    - тип модуляционной схемы
    %       waveformDuration  - длина анализируемого сигнала
    %       dopplerShift      - Допплеровский сдвиг частоты

    properties
        rmsEvm
        waveformMeanPower
        channelBandwidth
        noiseMeanPower
        modulationType
        waveformDuration
        dopplerShift
    end

    properties (Access = private)
        fftSize
        sampleRate
        cyclicPrefixLengthArray
        symbolLengthArray
        windowing
        symbolPhaseArray
        symbolPerSlotArray
        symbolsCount
        payloadSymbolArray
        subcarriersCount
        payloadSymbolsIdxArray
        sampleArray
    end

    methods
        function this = WaveformAnalyzer(waveformData, waveformInfo)
            % Конструктор класса. Чтение waveform-ы во временной области и структуры с информацией
            % необходимой для дальнейшей обработки данных и заполнения полей класса
            this.fftSize                    = waveformInfo.Nfft;
            this.sampleRate                 = waveformInfo.SampleRate;
            this.cyclicPrefixLengthArray    = waveformInfo.CyclicPrefixLengths;
            this.symbolLengthArray          = waveformInfo.SymbolLengths;
            this.windowing                  = waveformInfo.Windowing;
            this.symbolPhaseArray           = waveformInfo.SymbolPhases;
            this.symbolPerSlotArray         = waveformInfo.SymbolsPerSlot;
            this.symbolsCount               = waveformInfo.symbolsCount;
            this.payloadSymbolArray         = waveformInfo.payloadSymbols;
            this.subcarriersCount           = waveformInfo.subCarriersCount;
            this.payloadSymbolsIdxArray     = waveformInfo.payloadSymbolsIdxs;
            this.sampleArray                = waveformData;
        end

        function calcWaveformParameters(this)
            % Метод класса, реализующий расчет параметров сигнала.
            this.calcWaveformMeanPower();
            this.calcChannelBandwidth();
            this.calcModulationType();
            this.calcWaveformDuration();            
            this.calcDopplerShift();
            this.calcEvmPerformance();            
        end

        function plotPowerSpectrumDensity(this)
            % Метод класса, реализующий вывод спектральной плотности средней мощности в частотной области.

        end

        function plotPayloadConstellation(this)
            % Метод класса, реализующий вывод созвездия на комплексной плоскости.

        end
    end

    methods(Access = private)

        function calcWaveformMeanPower(this)
            % Метод класса, реализующий расчет среднеквадратичного значения мощности сигнала.
            this.waveformMeanPower = mean(abs(this.sampleArray).^2);
        end

        function calcChannelBandwidth(this)
            % Метод класса, реализующий расчет ширины полосы канала.

        end

        function calcModulationType(this)
            % Метод класса, реализующий вычисления типа модуляционной схемы.

        end

        function calcWaveformDuration(this)
            % Метод класса, реализующий расчет длины анализируемого сигнала.

        end

        function calcDopplerShift(this)
            % Метод класса, реализующий расчет Допплеровского сдвига частоты.

        end

        function calcEvmPerformance(this)
            % Метод класса, реализующий расчет среднеквадратичное значение модуля вектора ошибки.

        end
    end
end